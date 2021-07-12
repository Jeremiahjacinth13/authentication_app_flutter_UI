import 'package:flutter/material.dart';
import 'body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Login', style: TextStyle(color: Colors.black87)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black87,
          onPressed: () => {},
        ),
      ),
      body: SingleChildScrollView(child: Body()),
    );
  }
}
