import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SelectJobWidget extends StatefulWidget {
  const SelectJobWidget({Key key}) : super(key: key);

  @override
  _SelectJobWidgetState createState() => _SelectJobWidgetState();
}

class _SelectJobWidgetState extends State<SelectJobWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Bg.png',
              ).image,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowDropDown(
                        initialOption: dropDownValue ??= 'Choose AD',
                        options: ['Choose AD', 'AD-1', 'AD-2'].toList(),
                        onChanged: (val) => setState(() => dropDownValue = val),
                        width: 240,
                        height: 40,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.customColor1,
                        ),
                        icon: Icon(
                          Icons.ac_unit,
                          color: Color(0xFF22FFE3),
                          size: 15,
                        ),
                        fillColor: Color(0xFF010524),
                        elevation: 3,
                        borderColor: Colors.transparent,
                        borderWidth: 10,
                        borderRadius: 15,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Go',
                          options: FFButtonOptions(
                            width: 150,
                            height: 40,
                            color: Color(0xFF010524),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                            ),
                            borderSide: BorderSide(
                              color: Color(0x00F0F5F6),
                              width: 1,
                            ),
                            borderRadius: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_iqi2sabx.json',
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'No add? post new one!',
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Post AD',
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      color: Color(0x00010524),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.background,
                        width: 1,
                      ),
                      borderRadius: 5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
