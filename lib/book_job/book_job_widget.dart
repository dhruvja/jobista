import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookJobWidget extends StatefulWidget {
  BookJobWidget({Key key}) : super(key: key);

  @override
  _BookJobWidgetState createState() => _BookJobWidgetState();
}

class _BookJobWidgetState extends State<BookJobWidget> {
  String dropDownValue1;
  String radioButtonValue1;
  String radioButtonValue2;
  String radioButtonValue3;
  String dropDownValue2;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  int countControllerValue;
  bool checkboxListTileValue;
  bool _loadingButton = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.customColor1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlutterFlowRadioButton(
                                  options: ['Electrician'],
                                  onChanged: (value) {
                                    setState(() => radioButtonValue1 = value);
                                  },
                                  optionHeight: 25,
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                  ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Plumber'],
                                  onChanged: (value) {
                                    setState(() => radioButtonValue2 = value);
                                  },
                                  optionHeight: 25,
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                  ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Carpentry'],
                                  onChanged: (value) {
                                    setState(() => radioButtonValue3 = value);
                                  },
                                  optionHeight: 25,
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                  ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    FlutterFlowDropDown(
                      options: ['Education '].toList(),
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 300,
                      height: 40,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayDark,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 10,
                      margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                      hidesUnderline: true,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: FlutterFlowDropDown(
                        options: ['Experience'].toList(),
                        onChanged: (val) =>
                            setState(() => dropDownValue2 = val),
                        width: 300,
                        height: 40,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.grayDark,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 15,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 10,
                        margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.customColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                            child: TextFormField(
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Pincode',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.grayDark,
                                ),
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
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayDark,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.customColor1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                              child: TextFormField(
                                controller: textController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Address',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.grayDark,
                                  ),
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
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.grayDark,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 80,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: TextFormField(
                          controller: textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'JOB Information ',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.grayDark,
                            ),
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
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.grayDark,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 7,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Please enter your experience';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.6, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 180, 10),
                        child: Text(
                          'Salary Stake',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Color(0xFF9E9E9E),
                          width: 1,
                        ),
                      ),
                      child: FlutterFlowCountController(
                        decrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.minus,
                          color:
                              enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                          size: 20,
                        ),
                        incrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.plus,
                          color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                          size: 20,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        count: countControllerValue ??= 5000,
                        updateCount: (count) =>
                            setState(() => countControllerValue = count),
                        stepSize: 500,
                        minimum: 4500,
                        maximum: 30000,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: CheckboxListTile(
                          value: checkboxListTileValue ??= true,
                          onChanged: (newValue) =>
                              setState(() => checkboxListTileValue = newValue),
                          title: Text(
                            'I agree for terms and conditions',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.dark400,
                              fontSize: 12,
                            ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton = true);
                        try {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageWidget(),
                            ),
                          );
                        } finally {
                          setState(() => _loadingButton = false);
                        }
                      },
                      text: 'BOOK ',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFF08253E),
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
                      loading: _loadingButton,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
