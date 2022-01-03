import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerSaWidget extends StatefulWidget {
  const WorkerSaWidget({Key key}) : super(key: key);

  @override
  _WorkerSaWidgetState createState() => _WorkerSaWidgetState();
}

class _WorkerSaWidgetState extends State<WorkerSaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    authorize();
  }

    var token;
  void authorize() async{
    try{
      final storage = new FlutterSecureStorage();
      var x = await storage.read(key: "jwt");
      setState((){
        token = x;
      });
    }
    catch(e) {
      print(e);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Applications',
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF090F13),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 24, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'All Activity from this past month.',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF8B97A2),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '14, Sept. 2021',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.check,
                                  color: Color(0xFF34C108),
                                  size: 24,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'New job',
                                  style: FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF151B1E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    'Accepted',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Andrew F.',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Details',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xFF010524),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '14, Sept. 2021',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Icon(
                                  Icons.cancel_outlined,
                                  color: Color(0xFFF02E31),
                                  size: 24,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Job role',
                                  style: FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF151B1E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    'declined',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF39D2C0),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Andrew F.',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Details',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xFFF02E31),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '14, Sept. 2021',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'New job offer',
                                  style: FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF151B1E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    '#001 Plumbing',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/252/600',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Andrew F.',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Apply',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xFF34C108),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(23, 0, 0, 0),
                        child: Container(
                          width: 2,
                          height: 152,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBE2E7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: Color(0xFFDBE2E7),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/allTasksComplete@2x.png',
                              width: 300,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Beginning of Activity',
                  style: FlutterFlowTheme.subtitle1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF151B1E),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
