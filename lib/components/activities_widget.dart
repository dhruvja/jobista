import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesWidget extends StatefulWidget {
  const ActivitiesWidget({Key key}) : super(key: key);

  @override
  _ActivitiesWidgetState createState() => _ActivitiesWidgetState();
}

class _ActivitiesWidgetState extends State<ActivitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 70,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0x6639D2C0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Icon(
                      Icons.monetization_on_rounded,
                      color: Color(0xFF39D2C0),
                      size: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'm2lsyec0' /*  Call for electrician */,
                        ),
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF1E2429),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'twecns67' /* Income */,
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'gg7uthks' /* 5000 Rs  */,
                      ),
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF010524),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kpqiixxs' /* Apply */,
                        ),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
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
    );
  }
}
