import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:j_o_b_ista/components/confirm_widget.dart';

import '../components/ad_info_sa_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AdInfoWidget extends StatefulWidget {
  var data;

  AdInfoWidget({Key key, @required this.data}) : super(key: key);

  @override
  _AdInfoWidgetState createState() => _AdInfoWidgetState();
}

class _AdInfoWidgetState extends State<AdInfoWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var values;
  bool applyState = false;

  @override
  void initState() {
    super.initState();
    values = widget.data;
    print(values);
    authorize();
    getApplyState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  var token;
  var data;

  void getApplyState() async{
try {
      final storage = new FlutterSecureStorage();
      var x = await storage.read(key: "applied");
      print(x);
      if(x != null){
        var applied = json.decode(x);
        if(applied.contains(values['id']))
        setState(() {
          applyState = true;
        });
      }
      
    } catch (e) {
      print(e);
      // Navigator.pop(context);
    }
  }

  void authorize() async {
    try {
      final storage = new FlutterSecureStorage();
      var x = await storage.read(key: "jwt");
      setState(() {
        token = x;
      });
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }


  void apply() async {
    try {
      String endpoint = Endpoint();
      var url = endpoint + "api/worker/apply";
      print(url);
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json'
          },
          body: jsonEncode(<String, String>{
            "client_id": values['user_id'].toString(),
            "ad_id": values['id'].toString(),
          }));
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        print(response.body);
        data = json.decode(response.body);
        if (data['success'])
          setState(() {
            applyState = true;
          });
        final storage = new FlutterSecureStorage();
        var x = await storage.read(key: "applied");
        if(x == null){
          List list = [];
          list.add(values['id']);
          await storage.write(key: "applied", value: json.encode(list));
        }
        else{
          var apply = json.decode(x);
          apply.add(values['id']);
          await storage.write(key: "applied", value: json.encode(apply));
          print(apply);
        }
        print(x);
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Text("Job Applied Successfully"),
              content: ConfirmWidget(),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("cancel"),
                )
              ]),
        );
      }

      if (!data['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Could not apply'),
              backgroundColor: Colors.redAccent),
        );
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Color(0x5139D2C0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Want_to_(2).png',
                    ).image,
                  ),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/439/600',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AdInfoSaWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.customColor1,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 20, 10, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: Text(
                                          'Name',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        values['username'],
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: Text(
                                          'Salary',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        values['maxsalary'].toString(),
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsetsDirectional.fromSTEB(
                            //       10, 20, 10, 20),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       Column(
                            //         mainAxisSize: MainAxisSize.max,
                            //         children: [
                            //           Icon(
                            //             Icons.settings_outlined,
                            //             color: Colors.black,
                            //             size: 24,
                            //           ),
                            //         ],
                            //       ),
                            //       Column(
                            //         mainAxisSize: MainAxisSize.max,
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Padding(
                            //             padding: EdgeInsetsDirectional.fromSTEB(
                            //                 0, 0, 0, 5),
                            //             child: Text(
                            //               'Hello World',
                            //               style: FlutterFlowTheme.bodyText1
                            //                   .override(
                            //                 fontFamily: 'Lexend Deca',
                            //                 fontSize: 10,
                            //                 fontWeight: FontWeight.w300,
                            //               ),
                            //             ),
                            //           ),
                            //           Text(
                            //             'Hello World',
                            //             style: FlutterFlowTheme.bodyText1,
                            //           ),
                            //         ],
                            //       ),
                            //       Column(
                            //         mainAxisSize: MainAxisSize.max,
                            //         children: [
                            //           Icon(
                            //             Icons.settings_outlined,
                            //             color: Colors.black,
                            //             size: 24,
                            //           ),
                            //         ],
                            //       ),
                            //       Column(
                            //         mainAxisSize: MainAxisSize.max,
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: [
                            //           Padding(
                            //             padding: EdgeInsetsDirectional.fromSTEB(
                            //                 0, 0, 0, 5),
                            //             child: Text(
                            //               'Hello World',
                            //               style: FlutterFlowTheme.bodyText1
                            //                   .override(
                            //                 fontFamily: 'Lexend Deca',
                            //                 fontSize: 10,
                            //               ),
                            //             ),
                            //           ),
                            //           Text(
                            //             'Hello World',
                            //             style: FlutterFlowTheme.bodyText1,
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: values['address_code'],
                                        hintStyle: FlutterFlowTheme.bodyText1,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            FlutterFlowTheme.customColor1,
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                      maxLines: 4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: textController1,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: values['description'],
                                      hintStyle: FlutterFlowTheme.bodyText1,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.customColor1,
                                    ),
                                    style: FlutterFlowTheme.bodyText1,
                                    maxLines: 4,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      if (applyState) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'You have already Applied'),
                                              backgroundColor:
                                                  Colors.green),
                                        );
                                      } else {
                                        return showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text("Confirmation"),
                                            content: Text(
                                                "Do you really want to apply for the job. This action cannot be undone."),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                  apply();
                                                },
                                                child: Text("okay"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Text("cancel"),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    text: applyState ? 'Applied' : 'Apply',
                                    options: FFButtonOptions(
                                      width: 300,
                                      height: 40,
                                      color: Color(0xFF307F07),
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
