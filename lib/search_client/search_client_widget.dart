import '../components/filter2_widget.dart';
import '../components/search_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../onboard/onboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SearchClientWidget extends StatefulWidget {
  SearchClientWidget({Key key}) : super(key: key);

  @override
  _SearchClientWidgetState createState() => _SearchClientWidgetState();
}

class _SearchClientWidgetState extends State<SearchClientWidget> {
  String choiceChipsValue1;
  String choiceChipsValue2;
  String choiceChipsValue3;
  bool present = false;
  var status;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  void search() async {
    print(textController.text);
    var data;
    try {
      var url = "http://localhost:5000/api/client/search/" + textController.text;
      print(url);
      final response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json'
          },
          body: jsonEncode(<String, String>{
            "designation": "",
            "edulevel": "2",
            "exptime": "",
            "minsalary": "",
            "pincode": ""
          }));
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        print(response.body);
        data = json.decode(response.body);
        if (data['success'])
          setState(() {
            status = data['rows'];
            present = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      endDrawer: Container(
        width: 300,
        child: Drawer(
          elevation: 16,
          child: Filter2Widget(),
        ),
      ),
      body: SafeArea(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: TextFormField(
                                  onChanged: (_) => setState(() {}),
                                  onFieldSubmitted: (_) async {
                                    search();
                                  },
                                  controller: textController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Search JOB',
                                    hintStyle: FlutterFlowTheme.bodyText1,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF022747),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF022747),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: FlutterFlowTheme.tertiaryColor,
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
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: FlutterFlowChoiceChips(
                                  initialOption: choiceChipsValue1 ??=
                                      'Job Type',
                                  options: [
                                    ChipData('Job Type', FontAwesomeIcons.robot)
                                  ],
                                  onChanged: (val) =>
                                      setState(() => choiceChipsValue1 = val),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xFF262D34),
                                    textStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                                    iconColor: Colors.white,
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Colors.white,
                                    textStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF262D34),
                                    ),
                                    iconColor: Color(0xFF262D34),
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  chipSpacing: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: FlutterFlowChoiceChips(
                                  initialOption: choiceChipsValue2 ??=
                                      'Location',
                                  options: [
                                    ChipData('Location', Icons.location_on)
                                  ],
                                  onChanged: (val) =>
                                      setState(() => choiceChipsValue2 = val),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xFF262D34),
                                    textStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                                    iconColor: Colors.white,
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Colors.white,
                                    textStyle:
                                        FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF262D34),
                                    ),
                                    iconColor: Color(0xFF262D34),
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  chipSpacing: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: FlutterFlowChoiceChips(
                                initialOption: choiceChipsValue3 ??=
                                    'Education',
                                options: [
                                  ChipData(
                                      'Education', Icons.cast_for_education)
                                ],
                                onChanged: (val) =>
                                    setState(() => choiceChipsValue3 = val),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFF262D34),
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                                  iconColor: Colors.white,
                                  iconSize: 18,
                                  elevation: 4,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF262D34),
                                  ),
                                  iconColor: Color(0xFF262D34),
                                  iconSize: 18,
                                  elevation: 4,
                                ),
                                chipSpacing: 20,
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
            if(present)
              ...(status).map((answer){
                  return SearchWidget();
                }).toList() 
            
          ],
        ),
      ),
    );
  }
}
