import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Search3Widget extends StatefulWidget {
  Search3Widget({Key key}) : super(key: key);

  @override
  _Search3WidgetState createState() => _Search3WidgetState();
}

class _Search3WidgetState extends State<Search3Widget> {
  String dropDownValue1;
  TextEditingController textController;
  String dropDownValue2;
  String radioButtonValue;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, -0.95),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: 320,
                            height: 300,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.customColor1,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-0.95, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(40, 0, 40, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 5, 0),
                                                          child:
                                                              FlutterFlowDropDown(
                                                            options: [
                                                              'Select JOB'
                                                            ].toList(),
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    dropDownValue1 =
                                                                        val),
                                                            width: 290,
                                                            height: 40,
                                                            textStyle:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            fillColor:
                                                                FlutterFlowTheme
                                                                    .customColor1,
                                                            elevation: 5,
                                                            borderColor: Color(
                                                                0x001D2429),
                                                            borderRadius: 3,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        1,
                                                                        1),
                                                            hidesUnderline:
                                                                true,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child:
                                                                TextFormField(
                                                              onChanged: (_) =>
                                                                  setState(
                                                                      () {}),
                                                              controller:
                                                                  textController,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Pincode',
                                                                hintStyle:
                                                                    FlutterFlowTheme
                                                                        .bodyText1,
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme
                                                                        .customColor1,
                                                                    width: 10,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme
                                                                        .customColor1,
                                                                    width: 10,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                filled: true,
                                                                fillColor:
                                                                    FlutterFlowTheme
                                                                        .customColor1,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            15,
                                                                            10,
                                                                            10),
                                                                suffixIcon:
                                                                    textController
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap: () =>
                                                                                setState(
                                                                              () => textController.clear(),
                                                                            ),
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              color: Color(0xFF757575),
                                                                              size: 22,
                                                                            ),
                                                                          )
                                                                        : null,
                                                              ),
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText1,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 5, 5),
                                                          child:
                                                              FlutterFlowDropDown(
                                                            options: [
                                                              'Education'
                                                            ].toList(),
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    dropDownValue2 =
                                                                        val),
                                                            width: 290,
                                                            height: 40,
                                                            textStyle:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            fillColor:
                                                                FlutterFlowTheme
                                                                    .customColor1,
                                                            elevation: 5,
                                                            borderColor: Color(
                                                                0x001D2429),
                                                            borderRadius: 3,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        1,
                                                                        1,
                                                                        1),
                                                            hidesUnderline:
                                                                true,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
                                                        child: Text(
                                                          'Experience',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowRadioButton(
                                                            options: [
                                                              'Less than 2 Years',
                                                              'More than 2 Years'
                                                            ],
                                                            onChanged: (value) {
                                                              setState(() =>
                                                                  radioButtonValue =
                                                                      value);
                                                            },
                                                            optionHeight: 25,
                                                            textStyle:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            buttonPosition:
                                                                RadioButtonPosition
                                                                    .left,
                                                            direction:
                                                                Axis.vertical,
                                                            radioButtonColor:
                                                                Color(
                                                                    0xFF022747),
                                                            inactiveRadioButtonColor:
                                                                Color(
                                                                    0x8A000000),
                                                            toggleable: false,
                                                            horizontalAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  50, 0, 50, 15),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Button',
                                            icon: Icon(
                                              Icons.person_search_sharp,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              color: Color(0xFF08253E),
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                            loading: _loadingButton,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.customColor1,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text(
                                'You may also LIKE',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  70, 20, 20, 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/mcatd_1.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Color(0x5D1D2429),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0x61000000),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 100,
                              indent: 0,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 0, 70, 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text(
                                ' ',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 20, 10, 70),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/9hsjc_2.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0x61000000),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
