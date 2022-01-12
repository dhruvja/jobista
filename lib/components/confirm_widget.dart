import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ConfirmWidget extends StatefulWidget {
  const ConfirmWidget({Key key}) : super(key: key);

  @override
  _ConfirmWidgetState createState() => _ConfirmWidgetState();
}

class _ConfirmWidgetState extends State<ConfirmWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Lottie.asset(
                'assets/lottie_animations/2309-check-animation.json',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                repeat: false,
                animate: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
