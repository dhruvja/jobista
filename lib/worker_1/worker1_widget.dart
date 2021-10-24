import '../auth/auth_util.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../track_car/track_car_widget.dart';
import '../worker_2/worker2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Worker1Widget extends StatefulWidget {
  Worker1Widget({Key key}) : super(key: key);

  @override
  _Worker1WidgetState createState() => _Worker1WidgetState();
}

class _Worker1WidgetState extends State<Worker1Widget> {
  String uploadedFileUrl = '';
  TextEditingController emailTextController;
  TextEditingController textController1;
  TextEditingController passwordController;
  bool passwordVisibility1;
  TextEditingController confirmPasswordTextController;
  bool passwordVisibility2;
  bool _loadingButton = true;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ImagePicker picker = ImagePicker();

  var present = false;
  var status;
  File _image;

  @override
  void initState() {
    super.initState();
    confirmPasswordTextController = TextEditingController();
    passwordVisibility2 = false;
    emailTextController = TextEditingController();
    textController1 = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility1 = false;
  }

  getImage() async {
    var image_source = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image_source.path);
    });

    print(image_source.path);
  }

  uploadImage(File imageFile) async {
    // open a bytestream
    print("hi");
    var stream = new http.ByteStream(imageFile.openRead());
    stream.cast();
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://localhost:5000/api/register");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: Path.basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['username'] = emailTextController.text;
    request.fields['phone'] = textController1.text;
    request.fields['password'] = passwordController.text;
    request.fields['type'] = "worker";
    request.fields['email'] = "";

    request
        .send()
        .then((result) async {
          http.Response.fromStream(result).then((response) async{
            if (response.statusCode == 200) {
              print("Uploaded! ");
              print('response.body ' + response.body);
              var data = json.decode(response.body);
              print(data['success']);
              setState((){
                present = true;
                status = data;

              });

              if (present) {
                print("true");
                if (status['success']) {
                  final storage = new FlutterSecureStorage();
                  await storage.write(key:"jwt", value: status['token']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Account Created Successfully'),
                        backgroundColor: Colors.green),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Account Couldnt be created'),
                        backgroundColor: Colors.redAccent),
                  );
                }
              }
            }

            return response.body;
          });
        })
        .catchError((err) => print('error : ' + err.toString()))
        .whenComplete(() {});
  }

  bool isloaded = false;
  var result;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.grayLight,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/Bg.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 20),
                          child: Image.asset(
                            'assets/images/JOBista.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: InkWell(
                                onTap: () {
                                  getImage();
                                },
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: _image == null
                                      ? Image.asset(
                                          'assets/images/Want_to_(6).png')
                                      : Image.file(_image),
                                  // ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    onChanged: (_) => setState(() {}),
                    controller: emailTextController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      hintStyle: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Lexend Deca',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF95A1AC),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF95A1AC),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.customColor1,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                      suffixIcon: emailTextController.text.isNotEmpty
                          ? InkWell(
                              onTap: () => setState(
                                () => emailTextController.clear(),
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.dark400,
                      fontWeight: FontWeight.normal,
                    ),
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid Name';
                      }

                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: TextFormField(
                      onChanged: (_) => setState(() {}),
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        hintStyle: FlutterFlowTheme.bodyText2.override(
                          fontFamily: 'Lexend Deca',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.customColor1,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
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
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.dark400,
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please  Provide your Mobile number';
                        }
                        if (val.length < 10) {
                          return 'Number is incomplete';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !passwordVisibility1,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16, 24, 24, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => passwordVisibility1 =
                                      !passwordVisibility1,
                                ),
                                child: Icon(
                                  passwordVisibility1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF95A1AC),
                                  size: 22,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please Enter your password';
                              }

                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: confirmPasswordTextController,
                      obscureText: !passwordVisibility2,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.grayLight,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.grayLight,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.grayLight,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.customColor1,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility2 = !passwordVisibility2,
                          ),
                          child: Icon(
                            passwordVisibility2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() => _loadingButton = true);
                                  try {
                                    if (!formKey.currentState.validate()) {
                                      return;
                                    }
                                    if (passwordController.text !=
                                        confirmPasswordTextController.text) {
                                      return;
                                    }
                                    uploadImage(_image);
                                    if(present){
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Worker2Widget(),
                                        ),
                                      );
                                    }
                                    

                                    // uploadImage(_image);
                                  } finally {
                                    setState(() => _loadingButton = false);
                                  }
                                },
                                text: 'Next',
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 50,
                                  color: Color(0xFF193498),
                                  textStyle:
                                      FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 50,
                                ),
                                loading: _loadingButton,
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
        ),
      ),
    );
  }
}
