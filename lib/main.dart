import 'package:authapp/screens/create_password/create_password.dart';
import 'package:authapp/screens/create_profile/create_profile.dart';
import 'package:authapp/screens/login/login.dart';
import 'package:authapp/screens/forgot_password/forgot_password.dart';
import 'package:authapp/screens/notify_topics/notify_topics.dart';
import 'package:authapp/screens/verify_password/verify_password.dart';
import 'package:flutter/material.dart';
import 'package:authapp/constants.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      // Lanre macaulay
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: <String, WidgetBuilder>{
        '/login_screen': (BuildContext context) => LoginScreen(),
        '/forgot_password': (BuildContext context) => ForgotPassword(),
        '/verify_password': (BuildContext context) => VerifyPasswordScreen(),
        '/create_password': (BuildContext context) => CreatePasswordScreen(),
        // '/create_profile': (BuildContext context) => CreateProfileScreen(),
        // '/notify_topics': (BuildContext context) => NotifyTopics(),
        // '/notification_accept': (BuildContext context) => NotificationAccept(),
      },
      home: LoginScreen(),
    );
  }
}
