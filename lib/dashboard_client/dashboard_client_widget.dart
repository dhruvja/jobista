import '../ad_info/ad_info_widget.dart';
import '../components/client_filter_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../search_client/search_client_widget.dart';
import '../search_customer/search_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardClientWidget extends StatefulWidget {
  const DashboardClientWidget({Key key}) : super(key: key);

  @override
  _DashboardClientWidgetState createState() => _DashboardClientWidgetState();
}

class _DashboardClientWidgetState extends State<DashboardClientWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            color: Color(0x5139D2C0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Want_to_(2).png',
              ).image,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 320,
                            height: 400,
                            decoration: BoxDecoration(
                              color: Color(0x58255C8F),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Color(0x16FFFFFF),
                                  spreadRadius: 10,
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0x00F0F5F6),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClientFilterWidget(),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 1.5,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchCustomerWidget(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.group_add,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0bjk0r4o' /* All Adds */,
                                              ),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'i7bedxa5' /* 10+ */,
                                              ),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xC908253E),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NavBarPage(
                                                  initialPage: 'applicants'),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.exposure,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pzivv91f' /* Applied Candidates */,
                                              ),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't1cgawx7' /* 22 */,
                                              ),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF08253E),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NavBarPage(
                                                  initialPage: 'allinone'),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.alarm_add,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tz38brkm' /* Shortlisted */,
                                              ),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        NavBarPage(
                                                            initialPage:
                                                                'home_client'),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5m8vb364' /* Call now */,
                                                ),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF08253E),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AdInfoWidget(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.wb_incandescent,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n1k7f5d8' /* Wishlist */,
                                              ),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SearchClientWidget(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qbjpifdo' /* Check now */,
                                                ),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF08253E),
                                                ),
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
                          ],
                        ),
                      ],
                    ),
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
