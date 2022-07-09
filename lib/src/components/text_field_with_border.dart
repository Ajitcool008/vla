import 'package:flutter/material.dart';

class TextFieldWithBorder extends StatelessWidget {
  const TextFieldWithBorder(
      {Key? key,
      required this.hint,
      this.icon,
      required this.controller,
      this.validator,
      this.passwordToggler,
      this.isTextObscure = false,
      this.keyboardType = TextInputType.text,
      this.maxLength,
      this.enabled,
      this.backgroundColor,
      this.borderColor,
      this.onTap})
      : super(key: key);

  final String hint;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? passwordToggler;
  final bool isTextObscure;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool? enabled;
  final Color? backgroundColor;
  final Color? borderColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: .6, color: borderColor ?? const Color(0xff868686)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 10, right: 5),
      alignment: Alignment.center,
      child: TextFormField(
        onTap: onTap,
        obscureText: isTextObscure,
        maxLength: maxLength,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        enabled: enabled,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: screenSize.width * .0389,
        ),
        decoration: InputDecoration(
          counterText: "",
          hintText: hint,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Montserrat",
            color: const Color(0xff969AA8),
            fontSize: screenSize.width * .0438,
            letterSpacing: .2,
          ),
          border: InputBorder.none,
          // suffixIcon: IconButton(
          //   onPressed: passwordToggler,
          //   icon: icon!,
          // ),
        ),
      ),
    );
  }
}
