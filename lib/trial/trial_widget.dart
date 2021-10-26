import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TrialWidget extends StatefulWidget {
  TrialWidget({Key key}) : super(key: key);

  @override
  _TrialWidgetState createState() => _TrialWidgetState();
}

class _TrialWidgetState extends State<TrialWidget> {
  String dropDownValue1;
  String dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      endDrawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowDropDown(
              options: ['Option 1'].toList(),
              onChanged: (val) => setState(() => dropDownValue1 = val),
              width: 130,
              height: 40,
              textStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: Colors.black,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Colors.transparent,
              borderWidth: 0,
              borderRadius: 0,
              margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
            ),
            FlutterFlowDropDown(
              options: ['Option 1'].toList(),
              onChanged: (val) => setState(() => dropDownValue2 = val),
              width: 130,
              height: 40,
              textStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: Colors.black,
              ),
              fillColor: Colors.white,
              elevation: 2,
              borderColor: Colors.transparent,
              borderWidth: 0,
              borderRadius: 0,
              margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
            )
          ],
        ),
      ),
    );
  }
}
