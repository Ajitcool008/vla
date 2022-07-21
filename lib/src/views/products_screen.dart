import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vla/src/controllers/product_controller.dart';
import 'package:vla/src/helpers/app_manager.dart';
import 'package:vla/src/helpers/utility_helper.dart';

import '../components/drawer_widget.dart';
import '../components/filter_offer.dart';
import '../helpers/app_snackbar.dart';
import 'cart_screen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final List<String> filteroffer = <String>['Brush', 'Comb', 'Paper', 'Copy', 'Laptop', 'Pen', 'Pencil', 'Book'];
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    var con = Get.put(ProductController());
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      //backgroundColor: Colors.brown,
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
            Text('Product',
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
                  con.productCart.length == 0
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
                              con.productCart.length.toString(),
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
      body: Stack(
        children: [
          // SizedBox(
          //     height: Get.height*0.9,
          //     width: Get.width*0.9999,
          //     child: Image.asset('assets/images/backgoundimage.png',fit: BoxFit.fill,)),
          // Positioned(
          //   top: Get.height*0.23,
          //   left: Get.width*0.37,
          //   child: SizedBox(
          //       height: Get.height*0.7,
          //       width: Get.width*0.99,
          //       child: Image.asset('assets/images/shoppingcart-removebg-preview.png',
          //         fit: BoxFit.fill,)),
          // ),
          Column(
            children: [
              SizedBox(height: screenSize.width * .03),
              SizedBox(height: 40, child: filterOffers(con)),
              SizedBox(height: screenSize.width * .03),
              Container(
                height: Get.height * 0.06,
                // width: Get.width * 0.999,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:  Colors.green,
                  //color: const Color.fromRGBO(14, 190, 127, 89),
                  border: Border.all(color: Colors.white, width: 2),
                  //borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width*0.13,
                      child: const Text(
                        'Name',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: Get.width*0.14,
                      child: const Text(
                        'Price',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: Get.width*0.13,
                      child: const Text(
                        'Tonnes',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: Get.width*0.12,
                      child: const Text(
                        'Piece',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: Get.width*0.075,
                      child: const Text(
                        '',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              _productCoupon(
                con,
                screenSize: screenSize,
                context: context,
              )
            ],
          ),
        ],
      ),
    ));
  }

  Widget filterOffers(ProductController con) {
    return Obx(() => ListView.builder(
        itemCount: con.categoryData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              for (var element in con.categoryData) {
                element.isSelected = false;
              }
              con.categoryData[index].isSelected = true;
              con.getProductsData(categoryID: con.categoryData[index].recordId);
              con.categoryData.refresh();
            },
            child: FilterOffer(
              offerName: con.categoryData[index].name,
              isActive: con.categoryData[index].isSelected,
            ),
          );
        }));
  }

  Widget _productCoupon(
    ProductController con, {
    required Size screenSize,
    required BuildContext context,
  }) {
    final List<Color> colorCodes = <Color>[
      Colors.white,
      //Colors.green.shade100,
      Colors.green.shade100,
    ];
    const decoration = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 2.0),
    );
    return Obx(
      () => Expanded(
          child: ListView.builder(
              // padding: const EdgeInsets.all(8),
              // separatorBuilder: (BuildContext context, int index) => SizedBox(
              //   height: Get.height * 0.02,
              // ),
              itemCount: con.products.length,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    height: Get.height * 0.1,
                    decoration: BoxDecoration(
                      color: colorCodes[index],
                      //borderRadius: const BorderRadius.all(Radius.circular(4)),
                      // border: Border(
                      //   left: BorderSide(color: Color(0xff0EBE7F), width: 6),
                      //   right: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                      //   top: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                      //   bottom: BorderSide(width: .5, color: Color.fromRGBO(116, 102, 102, .5)),
                      // ),
                      //border: Border.all(width: 0.4, color: const Color(0xff6D6D6D)),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          con.products[index].name,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13),
                        ),
                        // Column(
                        //   children: [
                        //     Text(
                        //       con.products[index].name,
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //     // Text(
                        //     //   con.products[index].averageWeight,
                        //     //   style: TextStyle(color: Colors.black),
                        //     // ),
                        //   ],
                        // ),
                        Text(
                          con.products[index].price,
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                        SizedBox(
                            height: 40,
                            width: 70,
                            child: TextField(
                                style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
                                controller: con.products[index].ton,
                                decoration: const InputDecoration(
                                    enabledBorder: decoration, focusedBorder: decoration, border: decoration))),
                        SizedBox(
                            height: 40,
                            width: 70,
                            child: TextField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.black),
                                controller: con.products[index].piece,
                                decoration: const InputDecoration(
                                    enabledBorder: decoration, focusedBorder: decoration, border: decoration))),
                        InkWell(
                            onTap: () async {
                              if (con.products[index].piece.text.isEmpty && con.products[index].ton.text.isEmpty) {
                                AppSnackbar.showSnackbar("INFO", 'Enter some value', AlertType.info);
                              } else {
                                var checkPin = await UtilityHelper().getPincodeCheck(
                                    pincode: AppManager.loginHelper.restoreStudentListModel().data?.pincode ?? "");
                                if (checkPin) {
                                  var dataSet = {
                                    "operation": "ProductPrice",
                                    "Productid": con.products[index].productID,
                                    "InTon": con.products[index].ton.text,
                                    "Pcs": con.products[index].piece.text
                                  };
                                  var productPriceData = await con.getProductVal(input: dataSet);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text(productPriceData.name),
                                        content: Container(
                                          // height: 80,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text("Product Weight(Tonnes) : ${productPriceData.totalWeightIntonnes}"),
                                              Text("Product Piece : ${productPriceData.totalPices}"),
                                              Text("Calculated Price : ${productPriceData.calculatedPrice}"),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text("CANCEL"),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text("CONTINUE"),
                                            onPressed: () {
                                              con.addCart(item: productPriceData);
                                              Get.back();
                                            },
                                          )
                                        ],
                                      );
                                      ;
                                    },
                                  );
                                } else {
                                  AppSnackbar.showSnackbar("INFO", 'Pincode issue', AlertType.info);
                                }
                              }
                            },
                            child: const Icon(Icons.add)),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
