import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.name,
    this.fnToBeExecute,
  }) : super(key: key);

  final String name;
  final Function()? fnToBeExecute;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fnToBeExecute,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff997264),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Color(0xffffffff),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
