import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../register_client/register_client_widget.dart';
import '../worker_1/worker1_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({Key key}) : super(key: key);

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    final storage = new FlutterSecureStorage();
    getToken(storage);
  }

  getToken(storage) async{
    String token = await storage.read(key: "jwt");
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1597E5),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Color(0x001976D2),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(
                    'assets/images/Bg.png',
                  ).image,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Image.asset(
                                    'assets/images/Want_to_(4).png',
                                    width: 250,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      90, 0, 90, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() => _loadingButton1 = true);
                                      try {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Worker1Widget(),
                                          ),
                                        );
                                      } finally {
                                        setState(() => _loadingButton1 = false);
                                      }
                                    },
                                    text: 'WORKER',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: Color(0xFF012A55),
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
                                    loading: _loadingButton1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/Want_to_(5).png',
                                width: 250,
                                height: 300,
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      90, 0, 90, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() => _loadingButton2 = true);
                                      try {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterClientWidget(),
                                          ),
                                        );
                                      } finally {
                                        setState(() => _loadingButton2 = false);
                                      }
                                    },
                                    text: 'CLIENT',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: Color(0xFF012A55),
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
                                    loading: _loadingButton2,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
