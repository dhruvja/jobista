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

import 'confirm_widget.dart';

class ResultCustomerWidget extends StatefulWidget {
  final values;
  const ResultCustomerWidget({Key key, @required this.values})
      : super(key: key);

  @override
  _ResultCustomerWidgetState createState() => _ResultCustomerWidgetState();
}

class _ResultCustomerWidgetState extends State<ResultCustomerWidget> {
  var values;
  String endpoint = Endpoint();

  bool confirmState = false;
  bool declineState = false;

  void initState() {
    super.initState();
    values = widget.values;
  }

  void vals() {
    print(this.values);
  }

  void process(String status) async {
    try {
      String endpoint = Endpoint();
      var url = endpoint + "api/client/updatestatus";
      print(url);
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json'
          },
          body: jsonEncode(<String, String>{
            "id": values['apply_id'].toString(),
            "status": status,
          }));
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        print(response.body);
        var data = json.decode(response.body);
        if (data['success']) {
          if (status == "1") {
            setState(() {
              confirmState = true;
              declineState = false;
            });
          } else {
            setState(() {
              confirmState = false;
              declineState = true;
            });
          }
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: status == "1"
                    ? Text("Job Confirmed Successfully")
                    : Text("Job Declined Successfully"),
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

        else if (!data['success']) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Could not update the status'),
                backgroundColor: Colors.redAccent),
          );
        }
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
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Material(
          color: Colors.transparent,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 160,
            decoration: BoxDecoration(
              color: Color(0xFF012A55),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: AlignmentDirectional(0.050000000000000044, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 5),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://picsum.photos/seed/143/600',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      values['designation'],
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.customColor1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.15, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.05, 0),
                                        child: Text(
                                          values['username'],
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color:
                                                FlutterFlowTheme.customColor1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      values['pincode'],
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.customColor1,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      values['job_title'],
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.customColor1,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Experience',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF289CF0),
                                      ),
                                    ),
                                    Text(
                                      values['exptime'].toString() + " Years",
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.customColor1,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          if (confirmState) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'You have already Accepted the offer'),
                                                  backgroundColor:
                                                      Colors.green),
                                            );
                                          } else {
                                            return showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: Text("Confirmation"),
                                                content: Text(
                                                    "Do you really want to accept the person for the job. This action cannot be undone."),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                      process("1");
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
                                        text: confirmState
                                            ? 'Confirmed'
                                            : 'Confirm',
                                        options: FFButtonOptions(
                                          width: 80,
                                          height: 40,
                                          color: Color(0x0039D2C0),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color:
                                                FlutterFlowTheme.customColor1,
                                          ),
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          if (declineState) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'You have already Declined the offer'),
                                                  backgroundColor:
                                                      Colors.redAccent),
                                            );
                                          } else {
                                            return showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: Text("Confirmation"),
                                                content: Text(
                                                    "Do you really want to decline the person for the job. This action cannot be undone."),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                      process("0");
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
                                        text: declineState
                                            ? 'Declined'
                                            : 'Decline',
                                        options: FFButtonOptions(
                                          width: 100,
                                          height: 40,
                                          color: FlutterFlowTheme.background,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.dark400,
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
