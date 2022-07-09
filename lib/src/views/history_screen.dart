import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown,
        appBar: _appBar(context, screenSize),
        body: SingleChildScrollView(
            child: Column(children: [
          _historyCoupon(
            screenSize: screenSize,
            context: context,
            //img: EndPoints.imageUrlBase + coupon.icon,
            // title: coupon.businessName,
            // youSave: coupon.discountPrice,
            // date: coupon.date,
          )
        ])),
      ),
    );
  }

  AppBar _appBar(BuildContext context, Size screenSize) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      //leading: InkWell(child: Image.asset('assets/images/arrow-left.png'), onTap: () => Navigator.pop(context)),
      title: Text(
        "History",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: screenSize.width * .0438,
          color: Colors.white,
          fontFamily: 'Montserrat',
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _historyCoupon({
    required Size screenSize,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02, bottom: screenSize.width * 0.02),
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
                    Text(
                      'title',
                      style: TextStyle(color: Colors.white),
                    ),
                    //_couponTitile(title),
                    //_savedRupeesRow(youSave, context),
                    //_redeemedDate(date, context),
                  ],
                ),
              ),
            ),
            //Expanded(child: SizedBox.shrink()),
            _redeemedStampImage(),
            _redeemedStampImage(),
          ],
        ),
      ),
    );
  }

  Widget _redeemedStampImage() {
    return Image.asset("assets/images/redeemed@3x.png", height: 85, width: 60);
  }
}
