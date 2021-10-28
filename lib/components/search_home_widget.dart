import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../search3/search3_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHomeWidget extends StatefulWidget {
  SearchHomeWidget({Key key}) : super(key: key);

  @override
  _SearchHomeWidgetState createState() => _SearchHomeWidgetState();
}

class _SearchHomeWidgetState extends State<SearchHomeWidget> {
  String dropDownValue1;
  TextEditingController textController;
  String dropDownValue2;
  String radioButtonValue1;
  String radioButtonValue2;
  bool _loadingButton = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Container(
        width: 280,
        height: 300,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.customColor1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: FlutterFlowDropDown(
                options: ['Job Type', 'Electrician', 'Carpenter'].toList(),
                onChanged: (val) => setState(() => dropDownValue1 = val),
                width: 230,
                height: 40,
                textStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.black,
                ),
                fillColor: Color(0x00FFFFFF),
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 0,
                margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: TextFormField(
                onChanged: (_) => setState(() {}),
                onFieldSubmitted: (_) async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '',
                        style: TextStyle(),
                      ),
                      duration: Duration(milliseconds: 4000),
                    ),
                  );
                },
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter Pincode',
                  hintStyle: FlutterFlowTheme.bodyText1,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                  fillColor: Colors.transparent,
                  prefixIcon: Icon(
                    Icons.edit_location,
                  ),
                  suffixIcon: textController.text.isNotEmpty
                      ? InkWell(
                          onTap: () => setState(
                            () => textController.clear(),
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
            FlutterFlowDropDown(
              options: ['Education ', ''].toList(),
              onChanged: (val) => setState(() => dropDownValue2 = val),
              width: 230,
              height: 40,
              textStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: Colors.black,
              ),
              fillColor: Color(0x00FFFFFF),
              elevation: 2,
              borderColor: Colors.transparent,
              borderWidth: 0,
              borderRadius: 0,
              margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
            ),
            FlutterFlowRadioButton(
              options: ['Option 1'],
              onChanged: (value) {
                setState(() => radioButtonValue1 = value);
              },
              optionHeight: 25,
              textStyle: FlutterFlowTheme.bodyText1.override(
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
              options: ['Option 1'],
              onChanged: (value) {
                setState(() => radioButtonValue2 = value);
              },
              optionHeight: 25,
              textStyle: FlutterFlowTheme.bodyText1.override(
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
            FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search3Widget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              text: 'Button',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
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
        ),
      ),
    );
  }
}
