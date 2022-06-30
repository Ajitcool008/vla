import 'package:flutter/material.dart';

class FilterOffer extends StatelessWidget {
  FilterOffer({
    Key? key,
    required this.offerName,
    required this.isActive,
  }) : super(key: key);

  final String offerName;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * .0122),
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * .024),
      height: screenSize.width * .0826,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff997264) : const Color(0xff342924),
        border: isActive ? null : Border.all(width: .5, color: const Color(0xff7B7878)),
        borderRadius: BorderRadius.all(Radius.circular(screenSize.width * .0097)),
      ),
      alignment: Alignment.center,
      child: Text(
        offerName,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontSize: screenSize.width * .034,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}