import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:j_o_b_ista/allinone/allinone_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_client/home_client_widget.dart';
import 'book_job/book_job_widget.dart';
import 'client_sa/client_sa_widget.dart';
import 'applicants/applicants_widget.dart';
import 'allinone/allinone_widget.dart';
import 'home_client_copy/home_client_copy_widget.dart';
import 'offer_client/offer_client_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  Stream<JOBIstaFirebaseUser> userStream;
  JOBIstaFirebaseUser initialUser;
  bool displaySplashImage = true;

  void setLocale(Locale value) => setState(() => _locale = value);

  @override
  void initState() {
    super.initState();
    userStream = jOBIstaFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOBIsta',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('kn', ''),
        Locale('hi', ''),
      ],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/3thqu_J.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : AllinoneWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'onboard';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'home_client': HomeClientWidget(),
      'BookJob': BookJobWidget(),
      'client_sa': ClientSaWidget(),
      'applicants': ApplicantsWidget(),
      'allinone': AllinoneWidget(),
      'home_clientCopy': HomeClientCopyWidget(),
      'offer_client': OfferClientWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.customColor1,
        selectedItemColor: Color(0xFF000957),
        unselectedItemColor: FlutterFlowTheme.grayLight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bomb,
              size: 24,
            ),
            label: 'post job',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active,
              size: 24,
            ),
            label: 'Activity',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.monetization_on,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.link,
              size: 24,
            ),
            label: 'Links',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.monetization_on,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
