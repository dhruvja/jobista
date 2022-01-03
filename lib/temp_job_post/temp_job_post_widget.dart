import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../worker_sa/worker_sa_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../api_endpoint.dart';

class TempJobPostWidget extends StatefulWidget {
  const TempJobPostWidget({Key key}) : super(key: key);

  @override
  _TempJobPostWidgetState createState() => _TempJobPostWidgetState();
}

class _TempJobPostWidgetState extends State<TempJobPostWidget> {
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  bool checkboxListTileValue;
  bool present;
  List<String> roles = ["Select Job"];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String endpoint;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    endpoint = Endpoint();
    authorize();
    getRoles();
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

  void getRoles() async {
    try {
      String url = endpoint + "api/getroles";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        print(data['rows'][0]);
        var det = data['rows'];
        print(det.runtimeType);
        List<String> desig = ['Select Job'];
        det.forEach((var role) => {desig.add(role['designation'].toString())});
        print(desig);
        setState(() {
          roles = desig;
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

  void submitJob() async{
    try {
      String url = endpoint + "api/client/bookcontractjob";
      print(url);
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json'
          },
          body: jsonEncode(<String, String>{
            "designation": dropDownValue,
            "description": textController2.text,
            "latitude": "98.76",
            "longitude": "89.78"
          }));
      if (response.statusCode == 200) {
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Ad posted successfully'),
              backgroundColor: Colors.green),
        );
      } else {
        print("error code generated");
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
            color: FlutterFlowTheme.grayLight,
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
                padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: Container(
                          width: 200,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: Image.asset(
                                'assets/images/JOBista.png',
                              ).image,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: FlutterFlowDropDown(
                          options: roles,
                          onChanged: (val) =>
                              setState(() => dropDownValue = val),
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 50,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 10,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: TextFormField(
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController1',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Location',
                              hintStyle: FlutterFlowTheme.bodyText1,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.customColor1,
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Color(0xFFF02E31),
                              ),
                              suffixIcon: textController1.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => textController1.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.customColor1,
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            maxLines: 8,
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: CheckboxListTile(
                          value: checkboxListTileValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => checkboxListTileValue = newValue),
                          title: Text(
                            'I  accept for all terms and conditions',
                            style: TextStyle(
                              color: Color(0xFF010524),
                              fontSize: 12,
                            ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          submitJob();
                        },
                        text: 'Post JOB',
                        options: FFButtonOptions(
                          width: 130,
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
                    ],
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
