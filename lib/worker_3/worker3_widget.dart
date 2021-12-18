import '../auth/auth_util.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../onboard/onboard_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Worker3Widget extends StatefulWidget {
  const Worker3Widget({Key key}) : super(key: key);

  @override
  _Worker3WidgetState createState() => _Worker3WidgetState();
}

class _Worker3WidgetState extends State<Worker3Widget> {
  String uploadedFileUrl1 = '';
  TextEditingController textController;
  String uploadedFileUrl2 = '';
  int countControllerValue;
  bool checkboxListTileValue;
  bool _loadingButton = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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
              color: Color(0xFFEEEEEE),
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
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Image.asset(
                        'assets/images/JOBista.png',
                        width: 300,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            validateFileFormat(
                                selectedMedia.storagePath, context)) {
                          showUploadMessage(context, 'Uploading file...',
                              showLoading: true);
                          final downloadUrl = await uploadData(
                              selectedMedia.storagePath, selectedMedia.bytes);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrl != null) {
                            setState(() => uploadedFileUrl1 = downloadUrl);
                            showUploadMessage(context, 'Success!');
                          } else {
                            showUploadMessage(
                                context, 'Failed to upload media');
                            return;
                          }
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/418/600',
                        ),
                      ),
                    ),
                    Text(
                      'Upload Photo',
                      style: FlutterFlowTheme.bodyText1,
                    ),
                    Container(
                      width: 300,
                      height: 160,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Experience ',
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: InkWell(
                        onTap: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              validateFileFormat(
                                  selectedMedia.storagePath, context)) {
                            showUploadMessage(context, 'Uploading file...',
                                showLoading: true);
                            final downloadUrl = await uploadData(
                                selectedMedia.storagePath, selectedMedia.bytes);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            if (downloadUrl != null) {
                              setState(() => uploadedFileUrl2 = downloadUrl);
                              showUploadMessage(context, 'Success!');
                            } else {
                              showUploadMessage(
                                  context, 'Failed to upload media');
                              return;
                            }
                          }
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.customColor1,
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.background,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: AutoSizeText(
                              'Upload Age Proof',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.grayDark,
                              ),
                            ),
                          ),
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
                          'Expected Salary',
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
                          final user = await signInAnonymously(context);
                          if (user == null) {
                            return;
                          }
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardWidget(),
                            ),
                            (r) => false,
                          );
                        } finally {
                          setState(() => _loadingButton = false);
                        }
                      },
                      text: 'Sign UP',
                      icon: FaIcon(
                        FontAwesomeIcons.signLanguage,
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
