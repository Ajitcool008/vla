import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vla/src/controllers/product_controller.dart';
import 'package:vla/src/helpers/app_manager.dart';
import 'package:vla/src/helpers/utility_helper.dart';

import '../components/filter_offer.dart';
import '../helpers/app_snackbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var con = Get.find<ProductController>();
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: (){},
        //   icon: const Icon(Icons.shopping_cart),
        // ),
        centerTitle: true,
        title: const Center(
            child: const Text(
          'Cart',
          style: TextStyle(fontSize: 23),
        )),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () async {
            var marketCheck = await UtilityHelper().getMarketCheck();
            if (marketCheck) {
              AppSnackbar.showSnackbar("SUCCESS", 'Market is open', AlertType.success);
            } else {
              AppSnackbar.showSnackbar("INFO", 'Market is closed', AlertType.info);
            }
          },
          child: Text("CHECKOUT")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          SizedBox(height: screenSize.width * .03),
          Container(
            height: Get.height * 0.07,
            // width: Get.width * 0.999,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const Text(
                  'Price',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const Text(
                  'Ton',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const Text(
                  'Piece',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const Text(
                  'Action',
                  style: TextStyle(color: Colors.black, fontSize: 18),
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
    ));
  }

  Widget _productCoupon(
    ProductController con, {
    required Size screenSize,
    required BuildContext context,
  }) {
    return Obx(
      () => Expanded(
          child: ListView.builder(
              itemCount: con.productCart.length,
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
                      Text(
                        con.productCart[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        con.productCart[index].price,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        con.productCart[index].totalWeight.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        con.productCart[index].totalPices.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () async {
                          con.removeCart(item: con.productCart[index]);
                        },
                        child: Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.2,
                          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Text(
                              'Remove',
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
