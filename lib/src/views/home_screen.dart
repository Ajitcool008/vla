import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vla/src/controllers/home_controller.dart';
import 'package:vla/src/helpers/app_manager.dart';
import 'package:vla/src/views/auth_screens/signin_signup_screen.dart';
import 'package:vla/src/views/cart_screen.dart';
import 'package:vla/src/views/profilehistory_screen.dart';

import '../components/drawer_widget.dart';
import '../controllers/product_controller.dart';

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
    var procon = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: Get.height*0.08,
        backgroundColor: Colors.green,
        //Color(0xff1ECB8D),
        elevation: 1.0,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: Get.height*0.04,
            width: Get.width*0.14,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(color: Colors.grey.shade400)
            ),
            child: IconButton(
                onPressed: () => con.scaffoldEy.currentState!.openDrawer(),
              icon: const Icon(Icons.menu),
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/launcher_icon.png')
            // ),
            Text('Market',
            style: TextStyle(color: Colors.black, fontSize: 23),)
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const CartScreen());
              },
              child: Obx(() => Stack(
                children: <Widget>[
                  Container(
                    height: Get.height*0.07,
                    width: Get.width*0.11,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(90),
                      //border: Border.all(color: Colors.grey.shade400)
                    ),
                    child: const IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      onPressed: null,
                    ),
                  ),
                  procon.productCart.length == 0
                      ? Positioned(
                    top: 0,
                    right: 4,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : Positioned(
                    top: 0,
                    right: 4,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              procon.productCart.length.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          )
        ],
      ),
      key: con.scaffoldEy,
      drawer: DrawerElement(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.007,
                ),
                SizedBox(
                  height: Get.height * 0.69,
                  child: Obx(() => ListView.separated(
                      padding: const EdgeInsets.all(3),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(
                        height: Get.height * 0.01,
                      ),
                      itemCount: con.productData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to(()=> PriceHistoryScreen());
                          },
                          child: Container(
                            height: Get.height * 0.08,
                            width: Get.width * 0.95,
                            //padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                 left: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                right: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                top: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                bottom: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.0,
                                    offset: Offset(0.0, 0.75)
                                )
                              ],
                            ),
                            //decoration: BoxDecoration(color: Colors.brown[colorCodes[index]]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.arrow_drop_down,size: 45,
                                    color: Colors.red.shade600,)),
                                SizedBox(
                                  width: Get.width*0.48,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: Get.height*0.008,),
                                      Text(
                                        ' ${con.productData[index].name}',
                                        style: const TextStyle(color: Colors.black, fontSize: 18),
                                      ),
                                      Text('Saturday,July 9, 2022')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width*0.28,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: Get.height*0.01,),
                                      Text(
                                        "₹ ${con.productData[index].price}",
                                        style: const TextStyle(color: Colors.blue, fontSize: 16),
                                      ),
                                      Text(
                                        "-100.00",
                                        style: const TextStyle(color: Colors.red, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                // IconButton(
                                //     onPressed: () {
                                //       showModalBottomSheet(
                                //           context: context,
                                //           backgroundColor: Colors.white,
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                                //           ),
                                //           builder: (BuildContext context){
                                //             return SizedBox(
                                //               height: Get.height*0.5,
                                //               child: Column(
                                //                 children: [
                                //                   SizedBox(height: Get.height*0.02,),
                                //                   Text('Previous Market',
                                //                     style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),),
                                //                   SizedBox(height: Get.height*0.02,),
                                //                   SizedBox(
                                //                     height: Get.height*0.42,
                                //                     child: ListView.separated(
                                //                         padding: const EdgeInsets.all(8),
                                //                         separatorBuilder: (BuildContext context, int index) => SizedBox(
                                //                           height: Get.height * 0.02,
                                //                         ),
                                //                         itemCount: con.productData.length,
                                //                         itemBuilder: (BuildContext context, int index){
                                //                           return ClipRRect(
                                //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                //                             child: Container(
                                //                               height: Get.height * 0.08,
                                //                               width: Get.width * 0.95,
                                //                               decoration: BoxDecoration(
                                //                                 border: Border(
                                //                                   left: BorderSide(color: Color(0xff0EBE7F), width: 6),
                                //                                   right: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                //                                   top: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                //                                   bottom: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                                //                                 ),
                                //                               ),
                                //                               child: Row(
                                //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //                                 children: [
                                //                                   Text(
                                //                                     //((con.dashboardData.value.data ?? [])[0].promotionInfo[index].link)
                                //                                     con.productData[index].data[index].name,
                                //                                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                //                                   Text(
                                //                                     "₹${con.productData[index].data[index].price.toString()}",
                                //                                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                //                                   Text(
                                //                                     con.productData[index].data[index].dateTime.toString(),
                                //                                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                //                                 ],
                                //                               ),
                                //                             ),
                                //                           );
                                //                         }
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             );
                                //
                                //           }
                                //       );
                                //     },
                                //     icon: const Icon(
                                //       Icons.menu_outlined,
                                //       color: Colors.black,
                                //     ))
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
