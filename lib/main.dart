import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:j_o_b_ista/components/activities_widget.dart';
import 'package:j_o_b_ista/post_j_o_b/post_j_o_b_widget.dart';
import 'package:j_o_b_ista/worker_confirmation/worker_confirmation_widget.dart';
import 'package:j_o_b_ista/worker_home/worker_home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/firebase_user_provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:j_o_b_ista/allinone/allinone_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'billing/billing_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_client/home_client_widget.dart';
import 'book_job/book_job_widget.dart';
import 'client_sa/client_sa_widget.dart';
import 'applicants/applicants_widget.dart';
import 'allinone/allinone_widget.dart';
import 'login/login_widget.dart';
import 'services/LocalNotification.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  if (message != null) {
    print(message.notification.title);
    print(message.notification.body);
    print(message.data.toString());
  }

  // Create a notification for this
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        "client": (_) => HomeClientWidget(),
        "worker": (_) => WorkerHomeWidget(),
        "worker_confirmation": (_) => WorkerConfirmationWidget(),
        "bill_generation": (_) => BillingWidget()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<JOBIstaFirebaseUser> userStream;
  JOBIstaFirebaseUser initialUser;
  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    LocalNotification.initialize(context);

    getToken();

    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        print(message.data['route']);
        var route = message.data['route'].toString();
        try {
          print(message.data['worker']);
          if (message.data['worker']) {
            final prefs = await SharedPreferences.getInstance();
            prefs.setInt('worker_id', int.parse(message.data['worker']));

            Navigator.of(context).pushNamed(route);
          }
        } catch (e) {
          print(e);
          Navigator.of(context).pushNamed(route);
        }
      }
    });

    //foreground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification.body);
        print(message.notification.title);
      }
      LocalNotification.display(message);
    });

    //When the app is in background but opened in the background
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      if (message.data != null) {
        print(message.data['route']);
        var route = message.data['route'].toString();
        try {
          print(message.data['worker']);
          if (message.data['worker']) {
            final prefs = await SharedPreferences.getInstance();
            prefs.setInt('worker_id', int.parse(message.data['worker']));
            Navigator.of(context).pushNamed(route);
          }
        } catch (e) {
          print(e);
          Navigator.of(context).pushNamed(route);
        }
      }
    });

    userStream = jOBIstaFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  void getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOBIsta',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/JOBista.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginWidget(),
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
      'BookJob': PostJOBWidget(),
      'client_sa': ClientSaWidget(),
      'applicants': ApplicantsWidget(),
      'allinone': AllinoneWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
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
          )
        ],
        backgroundColor: FlutterFlowTheme.customColor1,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF000957),
        unselectedItemColor: FlutterFlowTheme.grayLight,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class WorkerNavBarPage extends StatefulWidget {
  WorkerNavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _WorkerNavBarPageState createState() => _WorkerNavBarPageState();
}

class _WorkerNavBarPageState extends State<WorkerNavBarPage> {
  String _currentPage = 'onboard';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'home_client': WorkerHomeWidget(),
      'BookJob': PostJOBWidget(),
      'client_sa': ClientSaWidget(),
      'applicants': ApplicantsWidget(),
      'allinone': AllinoneWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
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
            label: 'search',
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
          )
        ],
        backgroundColor: FlutterFlowTheme.customColor1,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF000957),
        unselectedItemColor: FlutterFlowTheme.grayLight,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
