import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:dio/dio.dart' as dio;

import '../../constants/string_constants.dart';
import '../app_manager.dart';
import '../app_snackbar.dart';
import 'endpoints.dart';

/// The NetworkManager class provide an API network requests
class NetworkManager {
  static final NetworkManager _apiService = NetworkManager._internal();

  Dio _dio = Dio();

  bool isContentTypeJson = true;
  bool _isHttpRequest = false;
  bool _urlEncode = false;
  bool sendCS = true;
  String baseUrl = Endpoints.baseURL;
  String? appUrl;

  factory NetworkManager() {
    return _apiService;
  }

  NetworkManager._internal();

  Dio getDio({isJsonType = true, isHttpRequest = false, isUrlEncoded = false}) {
    isContentTypeJson = isJsonType;
    _urlEncode = isUrlEncoded;
    _isHttpRequest = isHttpRequest;
    _init();
    return _dio;
  }

  static NetworkManager get instance => _apiService;

  _init() async {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.options.contentType = Headers.jsonContentType;
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: false,
    ));
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (AppManager.statusHelper.getLoginStatus) {
        String postToken = GetStorage().read(Constants.token) ?? "";
        if (sendCS) {
          options.headers["CSDATA"] = "Bearer $postToken";
        }
        options.headers["Authorization"] = "Bearer $postToken";
      }

      if (isContentTypeJson) options.headers["Content-Type"] = "application/json";

      if (_urlEncode) options.headers["Content-Type"] = "application/x-www-form-urlencoded";

      if (_isHttpRequest) options.headers["X-Requested-With"] = "XMLHttpRequest";
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    },
        //   onError: (DioError error, handler)  async {
        //     // Do something with response error
        //     if (error.response?.statusCode == 403) {
        //       _dio.interceptors.requestLock.lock();
        //       _dio.interceptors.responseLock.lock();
        //       RequestOptions options = error.response.requestOptions;
        //       FirebaseUser user = await FirebaseAuth.instance.currentUser();
        //       token = await user.getIdToken(refresh: true);
        //       await writeAuthKey(token);
        //       options.headers["Authorization"] = "Bearer " + token;

        //       _dio.interceptors.requestLock.unlock();
        //       _dio.interceptors.responseLock.unlock();
        //       return _dio.request(options.path,options: options);
        //     } else {
        //       return error.error;
        //     }
        //   }));
        //   _dio.options.baseUrl = baseUrl;
        //   return _dio;
        // }
        onError: (DioError e, handler) async {
      if (e.response?.statusCode == 403) {
        // try {
        var _input = {
          "operation": "RefreshToken",
          "user": {"UserName": "${GetStorage().read(Constants.userNameSaved)}"}
        };
        await _dio.post(Endpoints.refreshToken, data: _input).then((value) async {
          GetStorage().write(Constants.token, value.data['token']);
          // if (value.statusCode == 201) {
          //get new tokens ...
          // print("access token" + token);
          // print("refresh token" + refreshtoken);
          String postToken = GetStorage().read(Constants.token);
          //set bearer
          e.requestOptions.headers["Authorization"] = "Bearer $postToken";

          //create request with new access token
          final opts = Options(method: e.requestOptions.method, headers: e.requestOptions.headers);
          final cloneReq = await _dio.request(e.requestOptions.path,
              options: opts, data: e.requestOptions.data, queryParameters: e.requestOptions.queryParameters);

          return handler.resolve(cloneReq);
          // }
          // return handler.(e);
        });
        // } catch (e, st) {}
        if (!kReleaseMode) {
          AppSnackbar.showSnackbar(
              "API ERROR : ${e.requestOptions.path}", e.response.toString(), AlertType.internalInfo,
              position: SnackPosition.BOTTOM, duration: const Duration(seconds: 10));
        }
        // return handler.next(e); //continue
      } else {
        return handler.next(e);
      }
    }));

    _dio.options.receiveTimeout = 30000;
  }
}

// Future<dynamic> getApi(url, {Map<String, dynamic>? queryParameters}) async {
//   var response = await NetworkManager.instance.getDio().get(url, queryParameters: queryParameters).then((value) {
//     return value;
//   });
//   // .onError((dio.DioError error, stackTrace) async {
//   //   // if (error.error == "Http status error [403]") {
//   //   //   final getBox = GetStorage();
//   //   //   var _input = {
//   //   //     "operation": "RefreshToken",
//   //   //     "user": {"UserName": "${getBox.read(Constants.userNameSaved)}"}
//   //   //   };
//   //   //   var tokenResponse = await NetworkManager.instance.getDio().post(Endpoints.refreshToken, data: _input);
//   //   //   getBox.write(Constants.token, tokenResponse.data['token']);
//   //   //   await getApi(url, queryParameters: queryParameters);
//   //   // }

//   //   return error.error;
//   // });
//   return response;
// }

// Future<dynamic> postApi(url, {dynamic data}) async {
//   var response = await NetworkManager.instance.getDio().post(url, data: data).then((value) {
//     return value;
//   });
//   // .onError((dio.DioError error, stackTrace) async {
//   //   // if (error.error == "Http status error [403]") {
//   //   //   final getBox = GetStorage();
//   //   //   var _input = {
//   //   //     "operation": "RefreshToken",
//   //   //     "user": {"UserName": "${getBox.read(Constants.userNameSaved)}"}
//   //   //   };
//   //   //   var tokenResponse = await NetworkManager.instance.getDio().post(Endpoints.refreshToken, data: _input);
//   //   //   getBox.write(Constants.token, tokenResponse.data['token']);
//   //   //   await postApi(url, data: data);
//   //   // }
//   //   return error.error;
//   // });
//   return response;
// }

// Future<dynamic> putApi(url, {dynamic data}) async {
//   var response = await NetworkManager.instance.getDio().put(url, data: data).then((value) {
//     return value;
//   });
//   // .onError((dio.DioError error, stackTrace) async {
//   //   // if (error.error == "Http status error [403]") {
//   //   //   final getBox = GetStorage();
//   //   //   var _input = {
//   //   //     "operation": "RefreshToken",
//   //   //     "user": {"UserName": "${getBox.read(Constants.userNameSaved)}"}
//   //   //   };
//   //   //   var tokenResponse = await NetworkManager.instance.getDio().post(Endpoints.refreshToken, data: _input);
//   //   //   getBox.write(Constants.token, tokenResponse.data['token']);
//   //   //   await putApi(url, data: data);
//   //   // }
//   //   return error.error;
//   // });
//   return response;
// }
