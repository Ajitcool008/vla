import 'package:flutter/material.dart';

class OTPTimer extends StatefulWidget {
  const OTPTimer({Key? key}) : super(key: key);

  @override
  _OTPTimerState createState() => _OTPTimerState();
}

class _OTPTimerState extends State<OTPTimer> with TickerProviderStateMixin {
  late AnimationController controller;
  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    );

    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Text(
        countText,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xff997264),
          // color: Colors.white,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
