import '../ad_info/ad_info_widget.dart';
import '../api_endpoint.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'confirm_widget.dart';

class WorkerAdWidget extends StatefulWidget {
  final values;
  const WorkerAdWidget({Key key, @required this.values})
      : super(key: key);

  @override
  _WorkerAdWidgetState createState() => _WorkerAdWidgetState();
}

class _WorkerAdWidgetState extends State<WorkerAdWidget> {
  var values;
  String endpoint = Endpoint();

  TextEditingController textController;

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
      var url = endpoint + "api/worker/updateoffer";
      print(url);
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json'
          },
          body: jsonEncode(<String, String>{
            "id": values['ping_id'].toString(),
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.93,
              height: 200,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.customColor1,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () async {
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AdInfoWidget(),
                  //   ),
                  // );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/credit.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.9, 0),
                            child: Text(
                              'OFFERED',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF307F07),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                values['job_title'],
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF15212B),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.7, 0),
                                  child: Text(
                                    values['created_date'].toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xFF57636C),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 4, 0),
                                  child: Text(
                                    values['description'],
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: values['address_code'],
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      lineHeight: 1,
                                    ),
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
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    lineHeight: 1,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
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
                                  text: confirmState ? "Accepted" : "Accept",
                                  icon: Icon(
                                    Icons.thumb_up,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 120,
                                    height: 30,
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
                                    borderRadius: 2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
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
                                    text: declineState ? "Declined" : "Decline",
                                    icon: Icon(
                                      Icons.thumb_down,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 120,
                                      height: 30,
                                      color: Color(0xFFEF1013),
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 2,
                                    ),
                                  ),
                                ),
                              ],
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
    );
  }
}
