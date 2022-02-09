import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientFilterWidget extends StatefulWidget {
  const ClientFilterWidget({Key key}) : super(key: key);

  @override
  _ClientFilterWidgetState createState() => _ClientFilterWidgetState();
}

class _ClientFilterWidgetState extends State<ClientFilterWidget> {
  String dropDownValue1;
  TextEditingController textController;
  String dropDownValue2;
  int countControllerValue;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Container(
          width: 280,
          height: 300,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.customColor1,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: FlutterFlowDropDown(
                        options: [
                          FFLocalizations.of(context).getText(
                            'jjnxlxar' /* Select AD */,
                          ),
                          FFLocalizations.of(context).getText(
                            '25hetqpe' /* Electrician */,
                          )
                        ].toList(),
                        onChanged: (val) =>
                            setState(() => dropDownValue1 = val),
                        width: 180,
                        height: 40,
                        textStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.grayDark,
                        ),
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: FFLocalizations.of(context).getText(
                              'op8wniii' /* Pincode */,
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
                            prefixIcon: Icon(
                              Icons.edit_location,
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.grayDark,
                          ),
                          validator: (val) {
                            if (val.isEmpty) {
                              return FFLocalizations.of(context).getText(
                                'migzux8o' /* Please Enter the pincode befor... */,
                              );
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    FlutterFlowDropDown(
                      options: [
                        FFLocalizations.of(context).getText(
                          '4h0ulreu' /* Education */,
                        ),
                        FFLocalizations.of(context).getText(
                          't8wvnmr9' /* 10th Pass */,
                        )
                      ].toList(),
                      onChanged: (val) => setState(() => dropDownValue2 = val),
                      width: 180,
                      height: 40,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayDark,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.45, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'qwlrsh1d' /* Expereince */,
                        ),
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
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
                          count: countControllerValue ??= 0,
                          updateCount: (count) =>
                              setState(() => countControllerValue = count),
                          stepSize: 1,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'home_client'),
                          ),
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'zg7vauo5' /* Sort */,
                      ),
                      icon: Icon(
                        Icons.person_search,
                        size: 15,
                      ),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
