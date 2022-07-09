import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vla/src/controllers/product_controller.dart';
import 'package:vla/src/helpers/app_manager.dart';
import 'package:vla/src/helpers/utility_helper.dart';

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
        elevation: 1.0,
        backgroundColor: Color(0xff0EBE7F),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Center(
            child: const Text(
          'Product',
          style: TextStyle(fontSize: 23),
        )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => CartScreen());
              },
              child: Obx(() => Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      con.productCart.length == 0
                          ? Container()
                          : Positioned(
                              top: 0,
                              right: 4,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: 20.0,
                                    width: 20.0,
                                    decoration: const BoxDecoration(
                                      color: Colors.yellow,
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
      body: Column(
        children: [
          SizedBox(height: screenSize.width * .03),
          SizedBox(height: 40, child: filterOffers(con)),
          SizedBox(height: screenSize.width * .03),
          Container(
            height: Get.height * 0.06,
            // width: Get.width * 0.999,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Color.fromARGB(255, 4, 94, 250)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'Price',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'Ton',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'Piece',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'Action',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          _productCoupon(
            con,
            screenSize: screenSize,
            context: context,
            //img: EndPoints.imageUrlBase + coupon.icon,
            // title: coupon.businessName,
            // youSave: coupon.discountPrice,
            // date: coupon.date,
          )
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
              // nearbyMerchantScreenController: screenController,
            ),
          );
        }));
  }

  Widget _productCoupon(
    ProductController con, {
    required Size screenSize,
    required BuildContext context,
  }) {
    final decoration = const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.green, width: 2.0),
    );
    return Obx(
      () => Expanded(
          child: ListView.builder(
              itemCount: con.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff282727),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(width: 0.4, color: const Color(0xff6D6D6D)),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            con.products[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            con.products[index].averageWeight,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        con.products[index].price,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                          height: 40,
                          width: 70,
                          child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: con.products[index].ton,
                              decoration: InputDecoration(
                                  enabledBorder: decoration, focusedBorder: decoration, border: decoration))),
                      SizedBox(
                          height: 40,
                          width: 70,
                          child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: con.products[index].piece,
                              decoration: InputDecoration(
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
                                  return AlertDialog(
                                    title: Text(productPriceData.name),
                                    content: SizedBox(
                                      height: 80,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Calculated Weight : " + productPriceData.calculatedWeight),
                                          Text("Calculated Price : " + productPriceData.calculatedPrice.toString()),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text("CANCEL"),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      TextButton(
                                        child: Text("CONTINUE"),
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
                        child: Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.2,
                          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
