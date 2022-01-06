import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/experience_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
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

class BillingWidget extends StatefulWidget {
  const BillingWidget({Key key}) : super(key: key);

  @override
  _BillingWidgetState createState() => _BillingWidgetState();
}

class _BillingWidgetState extends State<BillingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var values;
  bool present = false;

  void initState() {
    super.initState();
    authorize();
    getId();
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

  void getId() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('worker_id');
    print(id);
    String endpoint = Endpoint();
    try {
      String url = endpoint + "api/client/getamount/" + id.toString();
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        print(data);
        setState(() {
          values = data[0];
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
      backgroundColor: Color(0x73002F88),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFF1E2429),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      buttonSize: 46,
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF4B39EF),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'Payment Confirmed!',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF93CFF8),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (present)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  '\₹' + values['amount'].toString(),
                  style: GoogleFonts.getFont(
                    'Overpass',
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 72,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
              child: Text(
                'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText2.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.customColor1,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFF1E2429),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFF090F13),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/Want_to_(3).png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              'Total Billing',
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF8B97A2),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          if (present)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                              child: Text(
                                '\₹' + values['amount'].toString(),
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ExperienceWidget(),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: 230,
                        height: 50,
                        color: Color(0xFF1E2429),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
