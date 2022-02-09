import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';

import '../components/search_worker_comp_widget.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../onboard/onboard_widget.dart';
import '../search_client/search_client_widget.dart';
import '../worker_2/worker2_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SearchCustomerWidget extends StatefulWidget {
  const SearchCustomerWidget({Key key}) : super(key: key);

  @override
  _SearchCustomerWidgetState createState() => _SearchCustomerWidgetState();
}

class _SearchCustomerWidgetState extends State<SearchCustomerWidget> {
  String dropDownValue1;
  TextEditingController textController1;
  String dropDownValue2;
  int countControllerValue;
  double sliderValue;
  double ratingBarValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var ads;
  bool present = false;
  bool empty = true;
  TextEditingController textController2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController1.text = "572101";
    dropDownValue1 = "Select Job";
    dropDownValue2 = "Education";
    authorize();
    search();
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

  void search() async {
    // print(textController2.text);
    var data;
    String endpoint = Endpoint();
    int edulevel = 0;
    String designation = "";

    designation = dropDownValue1;

    if (dropDownValue2 == "Education") edulevel = 0;

    if (dropDownValue1 == "Select Job") designation = "";

    if (dropDownValue2 == "studied till 9th")
      edulevel = 0;
    else if (dropDownValue2 == "10th pass")
      edulevel = 1;
    else if (dropDownValue2 == "12th pass")
      edulevel = 2;
    else if (dropDownValue2 == "Bachelors")
      edulevel = 3;
    else if (dropDownValue2 == 'Masters')
      edulevel = 4;
    else
      edulevel = 0;

    if(textController2.text == "")
      textController2.text = " ";
    if(textController2.text == "")
      textController2.text = " ";

    if (designation == null) designation = "";
    print(designation);

    try {
      var url = endpoint + "api/worker/search/" + textController2.text;
      print(url);
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json'
          },
          body: jsonEncode(<String, String>{
            "designation": designation,
            "edulevel": edulevel.toString(),
            "exptime": countControllerValue.toString(),
            "maxsalary": "",
            "pincode": textController1.text
          }));
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        print(response.body);
        data = json.decode(response.body);
        if (data['success']){
          final storage = new FlutterSecureStorage();
          await storage.delete(key: "applied");
          setState(() {
            ads = data['rows'];
            present = true;
          });
        }
        if (ads != null)
          setState(() {
            empty = false;
          });
      }

      if (!data['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Could not fetch data'),
              backgroundColor: Colors.redAccent),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('No Interent Found, try again'),
            backgroundColor: Colors.redAccent),
      );
    }
  }

  void values() {
    print(dropDownValue1); // role
    print(dropDownValue2); // education
    print(textController1.text); // pincode
    print(textController2.text); // search
    print(countControllerValue); // experience
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Color(0xFF08253E),
            automaticallyImplyLeading: true,
            actions: [],
            elevation: 6,
          ),
        ),
        backgroundColor: Colors.white,
        endDrawer: SingleChildScrollView(
                  child: Container(
            width: 300,
            height: 800,
            child: Drawer(
              elevation: 16,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.05, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.95, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: FlutterFlowDropDown(
                                        initialOption: dropDownValue1 ??= dropDownValue1,
                                        options: [
                                          'Select Job',
                                          'maid',
                                          'plumber',
                                          'electrician',
                                          'nurse',
                                          'driver',
                                          'cook'
                                        ].toList(),
                                        onChanged: (val) =>
                                            setState(() => dropDownValue1 = val),
                                        width: 190,
                                        height: 40,
                                        textStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                        ),
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 10,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            8, 4, 8, 4),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 10),
                                          child: TextFormField(
                                            controller: textController1,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Pincode',
                                              hintStyle:
                                                  FlutterFlowTheme.bodyText1,
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 10,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 10,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0x00FFFFFF),
                                            ),
                                            style: FlutterFlowTheme.bodyText1,
                                            validator: (val) {
                                              if (val.isEmpty) {
                                                return 'Field is required';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowDropDown(
                                      initialOption: dropDownValue2 ??= dropDownValue2,
                                      options: ['Education', 'Studied till 9th', '10th pass','12th pass','Bachelors','Masters'].toList(),
                                      onChanged: (val) =>
                                          setState(() => dropDownValue2 = val),
                                      width: 190,
                                      height: 40,
                                      textStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.black,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 10,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 8, 4),
                                      hidesUnderline: true,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Text(
                                        'Experience',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.bodyText1,
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
                                          color: enabled
                                              ? Color(0xDD000000)
                                              : Color(0xFFEEEEEE),
                                          size: 20,
                                        ),
                                        incrementIconBuilder: (enabled) => FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: enabled
                                              ? Colors.blue
                                              : Color(0xFFEEEEEE),
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
                                        updateCount: (count) => setState(
                                            () => countControllerValue = count),
                                        stepSize: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Salary Range',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ),
                                    Slider(
                                      activeColor: Color(0xFF08253E),
                                      inactiveColor: Color(0xFF9E9E9E),
                                      min: 5000,
                                      max: 100000,
                                      value: sliderValue ??= 5000,
                                      divisions: 190,
                                      onChanged: (newValue) {
                                        setState(() => sliderValue = newValue);
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 10),
                                      child: Text(
                                        'Rating',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ),
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () => ratingBarValue = newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Color(0xFF08253E),
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: ratingBarValue ??= 3,
                                      unratedColor: Color(0xFF9E9E9E),
                                      itemCount: 5,
                                      itemSize: 40,
                                      glowColor: Color(0xFF08253E),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          search();
                                        },
                                        text: 'Filter',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xFF090F13),
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
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
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
                                          child: TextFormField(
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              'textController2',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            onFieldSubmitted: (_) async {
                                              // scaffoldKey.currentState.openEndDrawer();
                                              search();
                                            },
                                            controller: textController2,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Search JOB',
                                              hintStyle:
                                                  FlutterFlowTheme.bodyText1,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF022747),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF022747),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                              ),
                                              suffixIcon: textController2
                                                      .text.isNotEmpty
                                                  ? InkWell(
                                                      onTap: () => setState(
                                                        () => textController2
                                                            .clear(),
                                                      ),
                                                      child: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFF757575),
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              values();
                                              // scaffoldKey.currentState.openEndDrawer();
                                            },
                                            text: 'Job type',
                                            icon: FaIcon(
                                              FontAwesomeIcons.robot,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 35,
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 60,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              scaffoldKey.currentState.openEndDrawer();
                                            },
                                            text: 'Location',
                                            icon: Icon(
                                              Icons.location_on,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 35,
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 60,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              scaffoldKey.currentState.openEndDrawer();
                                            },
                                            text: 'Education',
                                            icon: Icon(
                                              Icons.history_edu,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 35,
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 60,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (present)
                  ...(ads).map((ad) {
                    return SearchWorkerCompWidget(ad);
                  })
                else
                  Lottie.asset(
                    'assets/lottie_animations/72785-searching.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    animate: true,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
