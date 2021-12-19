import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_j_o_b/post_j_o_b_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../api_endpoint.dart';

class SelectJobWidget extends StatefulWidget {
  const SelectJobWidget({Key key}) : super(key: key);

  @override
  _SelectJobWidgetState createState() => _SelectJobWidgetState();
}

class _SelectJobWidgetState extends State<SelectJobWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> titles = new List();
  var dets;

  void initState() {
    super.initState();
    getAds();
  }

  void getAds() async {
    String endpoint = Endpoint();
    try {
      String url = endpoint + "api/client/getads";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        // print(data);
        // setState((){
        //   dets = data;
        // });
        // ignore: deprecated_member_use
        List<String> tiles = new List();
        tiles.add('Choose AD');
        for(var i in data){
          tiles.add(i['job_title'].toString());
        }
        print(tiles.runtimeType);
        setState((){
          titles = tiles;
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
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowDropDown(
                        initialOption: dropDownValue ??= 'Choose AD',
                        options: titles,
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
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectJobWidget(),
                              ),
                            );
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
                  // Lottie.network(
                  //   'https://assets7.lottiefiles.com/packages/lf20_iqi2sabx.json',
                  //   width: 150,
                  //   height: 100,
                  //   fit: BoxFit.cover,
                  //   animate: true,
                  // ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'No add? post new one!',
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostJOBWidget(),
                        ),
                      );
                    },
                    text: 'Post add',
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
