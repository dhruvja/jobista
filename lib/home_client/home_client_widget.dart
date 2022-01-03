import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:j_o_b_ista/temp_job_post/temp_job_post_widget.dart';

import '../components/activities_widget.dart';
import '../components/options_widget.dart';
import '../components/search_home_widget.dart';
import '../components/worker_entry_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../api_endpoint.dart';

class HomeClientWidget extends StatefulWidget {
  const HomeClientWidget({Key key}) : super(key: key);

  @override
  _HomeClientWidgetState createState() => _HomeClientWidgetState();
}

class _HomeClientWidgetState extends State<HomeClientWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var ads;
  bool present = false;

  void initState() {
    super.initState();
    authorize();
    getAds();
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

  void getAds() async {
    String endpoint = Endpoint();
    try {
      String url = endpoint + "api/client/getads";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body);
        print(data);
        setState(() {
          ads = data;
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Want_to_(2).png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: SearchHomeWidget(),
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Bg.png',
                    ).image,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Text(
                                'Quick Service',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.customColor1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: OptionsWidget(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Activities',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFFFEFEFE),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      WorkerEntryWidget(),
                      // if (present)
                      // ...(ads).map((ad) {
                      //   return ActivitiesWidget(ad);
                      // })
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
