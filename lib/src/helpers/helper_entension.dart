import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilityHelper {
  static redirectToURL(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch $urlString';
    }
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey.shade400,
              Colors.blue.shade600,],
          stops: [
            0.3,
            0.7,
          ],
          tileMode: TileMode.mirror,
        )
        //   RadialGradient(
        //   center: Alignment.bottomRight,
        //   radius: 0.5,
        //   colors: <Color>[
        //     Colors.grey,
        //     Colors.blue,
        //   ],
        //   tileMode: TileMode.mirror,
        // )
              .createShader(bounds);
      },
      child: child,
    );
  }
}
