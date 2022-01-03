import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../components/ad_info_sa_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AdInfoWidget extends StatefulWidget {
  var data;

  AdInfoWidget({Key key, @required this.data}) : super(key: key);

  @override
  _AdInfoWidgetState createState() => _AdInfoWidgetState();
}

class _AdInfoWidgetState extends State<AdInfoWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var values;


  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    values = widget.data;
    print(values);
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 500,
                            decoration: BoxDecoration(
                              color: Color(0xFF0F044C),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: GridView(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 2,
                                            ),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .customColor1,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.nature,
                                                      color: Color(0xFF010524),
                                                      size: 24,
                                                    ),
                                                    Text(
                                                      values['username'],
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .customColor1,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.verified_sharp,
                                                      color: Colors.black,
                                                      size: 24,
                                                    ),
                                                    Text(
                                                      values['maxsalary'].toString(),
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: TextFormField(
                                      // initialValue: "hi",
                                      controller: textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Job description',
                                        labelStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                        ),
                                        hintText: 'Job discrition',
                                        hintStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
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
                                        fillColor:
                                            FlutterFlowTheme.customColor1,
                                      ),
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                      ),
                                      maxLines: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 80,
                                              icon: Icon(
                                                Icons.call,
                                                color: Color(0xFF34C108),
                                                size: 50,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 80,
                                                icon: Icon(
                                                  Icons.edit_location,
                                                  color: Color(0xFFF02E31),
                                                  size: 50,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Apply',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40,
                                        color: FlutterFlowTheme.primaryColor,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
