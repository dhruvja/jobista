import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key key}) : super(key: key);

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-0.05, 0),
              child: Lottie.network(
                'https://assets2.lottiefiles.com/temp/lf20_UsfnhV.json',
                width: 150,
                height: 130,
                fit: BoxFit.cover,
                animate: true,
              ),
            ),
            Lottie.network(
              'https://assets3.lottiefiles.com/packages/lf20_hslwihoj.json',
              width: 150,
              height: 130,
              fit: BoxFit.cover,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
