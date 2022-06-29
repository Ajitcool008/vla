bool validateMobile(String value) {
  const patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final regExp = RegExp(patttern);
  return regExp.hasMatch(value);
}
