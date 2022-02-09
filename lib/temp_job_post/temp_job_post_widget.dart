import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../worker_sa/worker_sa_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController(
        text: FFLocalizations.of(context).getText(
      '8wwgwml7' /* Job Description */,
    ));
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
                          options: [
                            FFLocalizations.of(context).getText(
                              'ivvfexnp' /* Jobtype */,
                            ),
                            FFLocalizations.of(context).getText(
                              '8binzi4l' /* Electrician */,
                            ),
                            FFLocalizations.of(context).getText(
                              'xehv6wq3' /* Plumber */,
                            )
                          ].toList(),
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
                              hintText: FFLocalizations.of(context).getText(
                                '3wza0btd' /* Location */,
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
                            FFLocalizations.of(context).getText(
                              '1bdr2ms2' /* I  accept for all terms and co... */,
                            ),
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
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkerSaWidget(),
                            ),
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          'zh90775s' /* Post JOB */,
                        ),
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
