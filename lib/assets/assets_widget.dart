import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AssetsWidget extends StatefulWidget {
  const AssetsWidget({Key key}) : super(key: key);

  @override
  _AssetsWidgetState createState() => _AssetsWidgetState();
}

class _AssetsWidgetState extends State<AssetsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/JOBista.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/mcatd_1.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/9hsjc_2.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  'assets/lottie_animations/72785-searching.json',
                  width: 150,
                  height: 130,
                  fit: BoxFit.cover,
                  animate: true,
                ),
                Lottie.asset(
                  'assets/lottie_animations/64018-searching-data.json',
                  width: 150,
                  height: 130,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
