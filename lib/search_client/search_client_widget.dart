import '../components/search_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../onboard/onboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchClientWidget extends StatefulWidget {
  SearchClientWidget({Key key}) : super(key: key);

  @override
  _SearchClientWidgetState createState() => _SearchClientWidgetState();
}

class _SearchClientWidgetState extends State<SearchClientWidget> {
  String choiceChipsValue1;
  String choiceChipsValue2;
  String choiceChipsValue3;
  TextEditingController textController2;
  String dropDownValue1;
  TextEditingController textController1;
  String dropDownValue2;
  int countControllerValue;
  double sliderValue;
  double ratingBarValue;
  bool _loadingButton = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
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
        backgroundColor: Color(0x1D255C8F),
        endDrawer: Container(
          width: 300,
          child: Drawer(
            elevation: 16,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.05, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      35, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: FlutterFlowDropDown(
                                          initialOption: dropDownValue1 ??=
                                              'Select job',
                                          options: ['Select job'].toList(),
                                          onChanged: (val) => setState(
                                              () => dropDownValue1 = val),
                                          width: 190,
                                          height: 40,
                                          textStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.black,
                                          ),
                                          fillColor: Color(0x00FFFFFF),
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 10,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 4, 8, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: TextFormField(
                                              controller: textController1,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Pincode',
                                                hintStyle:
                                                    FlutterFlowTheme.bodyText1,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 10,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
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
                                        options: ['Education'].toList(),
                                        onChanged: (val) => setState(
                                            () => dropDownValue2 = val),
                                        width: 190,
                                        height: 40,
                                        textStyle:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.black,
                                        ),
                                        fillColor: Color(0x00FFFFFF),
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
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0xFF9E9E9E),
                                            width: 1,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? Color(0xDD000000)
                                                : Color(0xFFEEEEEE),
                                            size: 20,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
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
                                          updateCount: (count) => setState(() =>
                                              countControllerValue = count),
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
                                          setState(
                                              () => sliderValue = newValue);
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
                                            setState(
                                                () => _loadingButton = true);
                                            try {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SearchClientWidget(),
                                                ),
                                              );
                                            } finally {
                                              setState(
                                                  () => _loadingButton = false);
                                            }
                                          },
                                          text: 'Filter',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color: Color(0xFF090F13),
                                            textStyle: FlutterFlowTheme
                                                .subtitle2
                                                .override(
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
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
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
        body: SafeArea(
          child: SingleChildScrollView(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: TextFormField(
                                      onChanged: (_) => setState(() {}),
                                      onFieldSubmitted: (_) async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OnboardWidget(),
                                          ),
                                        );
                                      },
                                      controller: textController2,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Search JOB',
                                        hintStyle: FlutterFlowTheme.bodyText1,
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
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 10, 10, 10),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.tertiaryColor,
                                        ),
                                        suffixIcon: textController2
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () => setState(
                                                  () => textController2.clear(),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: FlutterFlowChoiceChips(
                                      initialOption: choiceChipsValue1 ??=
                                          'Job Type',
                                      options: [
                                        ChipData(
                                            'Job Type', FontAwesomeIcons.robot)
                                      ],
                                      onChanged: (val) => setState(
                                          () => choiceChipsValue1 = val),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: FlutterFlowChoiceChips(
                                      initialOption: choiceChipsValue2 ??=
                                          'Location',
                                      options: [
                                        ChipData('Location', Icons.location_on)
                                      ],
                                      onChanged: (val) => setState(
                                          () => choiceChipsValue2 = val),
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
                SearchWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
