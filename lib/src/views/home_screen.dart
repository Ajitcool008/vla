import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vla/src/controllers/home_controller.dart';
import 'package:vla/src/helpers/app_manager.dart';
import 'package:vla/src/views/auth_screens/signin_signup_screen.dart';
import 'package:vla/src/views/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<String> productname = <String>[
    'Brush',
    'Comb',
    'Paper',
    "NoteBook",
    'Copy',
    'Laptop',
    'Computer',
    'Pen',
    'Pencil',
    'Book'
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500,
    600,
    500,
  ];
  @override
  Widget build(BuildContext context) {
    var con = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0EBE7F),
        //Color(0xff1ECB8D),
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            AppManager.statusHelper.setLoginStatus(false);
            GetStorage().erase();
            Get.offAll(() => SigninSignupScreen());
          },
          icon: const Icon(Icons.logout),
        ),
        centerTitle: true,
        title: Text(
          'Market',
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            SizedBox(
              height: Get.height * 0.065,
              width: Get.width * 0.89,
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  // icon:  Icon(Icons.search),
                  labelText: "Search market",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            // Container(
            //   height: Get.height * 0.07,
            //   width: Get.width * 0.999,
            //   padding: const EdgeInsets.all(8),
            //   decoration: const BoxDecoration(color: Colors.white),
            //   child:
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         'Name',
            //         style: TextStyle(color: Colors.black, fontSize: 18),
            //       ),
            //       const Text(
            //         'Price',
            //         style: TextStyle(color: Colors.black, fontSize: 18),
            //       ),
            //       const Text(
            //         'Action',
            //         style: TextStyle(color: Colors.black, fontSize: 18),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: Get.height*0.01,),
            SizedBox(
              height: Get.height * 0.69,
              child: Obx(() => ListView.separated(
                  padding: const EdgeInsets.all(8),
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                        height: Get.height * 0.02,
                      ),
                  itemCount: con.productData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: Get.height * 0.08,
                        width: Get.width * 0.95,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Color(0xff0EBE7F), width: 6),
                            right: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                            top: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                            bottom: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                          ),
                        ),
                        //decoration: BoxDecoration(color: Colors.brown[colorCodes[index]]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' ${con.productData[index].name}',
                              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "₹ ${con.productData[index].price}",
                              style: const TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                                      ),
                                      builder: (BuildContext context){
                                        return SizedBox(
                                          height: Get.height*0.5,
                                          child: Column(
                                            children: [
                                              SizedBox(height: Get.height*0.02,),
                                              Text('Previous Market',
                                                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),),
                                              SizedBox(height: Get.height*0.02,),
                                              SizedBox(
                                                height: Get.height*0.4,
                                                child: ListView.separated(
                                                    padding: const EdgeInsets.all(8),
                                                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    itemCount: con.productData.length,
                                                    itemBuilder: (BuildContext context, int index){
                                                      return ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                        child: Container(
                                                            height: Get.height * 0.08,
                                                            width: Get.width * 0.95,
                                                            decoration: BoxDecoration(
                                                              border: Border(
                                                                left: BorderSide(color: Color(0xff0EBE7F), width: 6),
                                                                right: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                                                top: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                                                bottom: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                                              ),
                                                            ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                  con.productData[index].data[index].name.toString(),
                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                                              Text(
                                                                 "₹${con.productData[index].data[index].price.toString()}",
                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                                              Text(
                                                                  con.productData[index].data[index].dateTime.toString(),
                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                ),
                                              ),
                                            ],
                                          ),
                                        );

                                      }
                                  );
                                },
                                icon: const Icon(
                                  Icons.menu_outlined,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
