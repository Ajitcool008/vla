import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/filter_offer.dart';


class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final List<String> filteroffer = <String>['Brush', 'Comb', 'Paper', 'Copy', 'Laptop', 'Pen', 'Pencil','Book'];
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.brown,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //   onPressed: (){},
            //   icon: const Icon(Icons.shopping_cart),
            // ),
            title: const Center(child: const Text('Product',
              style: TextStyle(
                  fontSize: 23
              ),)),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.shopping_cart))],
          ),
          body: Padding(
            padding: EdgeInsets.only( right: screenSize.width * .02, left: screenSize.width * .02),
            child: Column(
              children: [
                SizedBox(height: screenSize.width * .03),
                filterOffers(),
                SizedBox(height: screenSize.width * .03),
                _productCoupon(
                  screenSize: screenSize,
                  context: context,
                  //img: EndPoints.imageUrlBase + coupon.icon,
                  // title: coupon.businessName,
                  // youSave: coupon.discountPrice,
                  // date: coupon.date,
                )
              ],
            ),
          ),
        )
    );
  }
  Widget filterOffers() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:  [
           InkWell(
            onTap: () {
             // screenController.selectedFilterOfferId = filter.id;
             // screenController.fetchNearbyMerchantsWithOfferId();
            },
            child: FilterOffer(
              offerName: filteroffer.first,
              isActive: isSelected,
             // nearbyMerchantScreenController: screenController,
            ),
          ),
        ])
      );
  }

  Widget _productCoupon({required Size screenSize, required BuildContext context,}) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width*0.02, right: Get.width*0.02, bottom: screenSize.width * 0.02),
      child: Container(
        height: screenSize.width * 0.241,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Color(0xFF6C6868), offset: Offset(0, 2), blurRadius: 3.0, spreadRadius: -2),
          ],
          color: const Color(0xff282727),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(width: 0.4, color: const Color(0xff6D6D6D)),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/beauty_fitness.png'),
            // _couponImage(screenSize, img),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 8),
              child: SizedBox(
                width: screenSize.width * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('title',
                      style: TextStyle(color: Colors.white),),
                    //_couponTitile(title),
                    //_savedRupeesRow(youSave, context),
                    //_redeemedDate(date, context),
                  ],
                ),
              ),
            ),
            //Expanded(child: SizedBox.shrink()),
           Container(
             height: Get.height*0.04,
             width: Get.width*0.2,
             decoration: BoxDecoration(
               border: Border.all(color: Colors.white)
             ),
             child: Center(
               child: Text('Add',
               style: TextStyle(color: Colors.white),),
             ),
           ),
          ],
        ),
      ),
    );
  }
}
