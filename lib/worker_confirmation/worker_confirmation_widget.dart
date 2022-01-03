import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../api_endpoint.dart';

class WorkerConfirmationWidget extends StatefulWidget {
  const WorkerConfirmationWidget({Key key}) : super(key: key);

  @override
  _WorkerConfirmationWidgetState createState() =>
      _WorkerConfirmationWidgetState();
}

class _WorkerConfirmationWidgetState extends State<WorkerConfirmationWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var info;
  bool present = false;

  @override
  void initState() {
    super.initState();
    authorize();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    getData();
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

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('worker_id');
    String endpoint = Endpoint();
    try {
      String url = endpoint + "api/contractworker/getinfo/" + id.toString();
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        print(data);
        setState(() {
          info = data;
          present = true;
        });
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('No Interent Found, try again'),
            backgroundColor: Colors.redAccent),
      );
    }
  }

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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Image.asset(
                        'assets/images/JOBista.png',
                        width: 300,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.customColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/799/600',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (present)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Name',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          info['username'].toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (present)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          info['phone'].toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (present)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'description',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          info['description'].toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Call now',
                        icon: Icon(
                          Icons.call,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 270,
                          height: 40,
                          color: Color(0xFF010524),
                          textStyle: FlutterFlowTheme.subtitle2.override(
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Report',
                        icon: Icon(
                          Icons.dangerous,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 270,
                          height: 40,
                          color: Color(0xFFF02E31),
                          textStyle: FlutterFlowTheme.subtitle2.override(
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
                  ],
                ),
              ),
            ],
          ).animated([animationsMap['rowOnPageLoadAnimation']]),
        ),
      ),
    );
  }
}
