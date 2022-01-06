import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDbWidget extends StatefulWidget {
  const ClientDbWidget({Key key}) : super(key: key);

  @override
  _ClientDbWidgetState createState() => _ClientDbWidgetState();
}

class _ClientDbWidgetState extends State<ClientDbWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 10, 2),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.customColor1,
                          boxShadow: [
                            BoxShadow(
                              color: FlutterFlowTheme.secondaryColor,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Image.asset(
                                    'assets/images/vaccine.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'DOUBLE\nVaccinated',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.dark400,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50, 10, 10, 10),
                                  child: Icon(
                                    Icons.check_box,
                                    color: Color(0xFF77BF18),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.customColor1,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Image.asset(
                                    'assets/images/aadhar.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AADHAR \nAuntenticated',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 10, 10, 10),
                                  child: Icon(
                                    Icons.radio_button_checked_sharp,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
