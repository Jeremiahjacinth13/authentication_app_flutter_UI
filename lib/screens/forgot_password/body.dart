import 'package:authapp/constants.dart';
import 'package:authapp/screens/verify_password/verify_password.dart';
import 'package:authapp/widgets/button.dart';
import 'package:authapp/widgets/input_fields.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool errorExists = false;
  String? error;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15.0),
          Text(
            'Forgot your password?',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 30.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 25.0),
          Container(
            width: size.width * 0.9,
            child: Text(
                'No worries, you just need to type your email address or username and we will send you a verification code',
                style: TextStyle(
                    fontSize: 18.0,
                    color: kTextColor.withOpacity(0.9),
                    height: 1.5)),
          ),
          SizedBox(height: 50.0),
          CustomTextField(
            text: "Email Address",
            onChanged: (String value) => emailController.text = value,
            validate: (String value) => {
              'isValid': value.length >= 10,
              'errorMessage': 'This is not a valid email address',
            },
          ),
          SizedBox(height: 20.0),
          CustomButton(
            text: "RESET MY PASSWORD",
            onPressed: () =>
                Navigator.pushNamed(context, VerifyPasswordScreen.routeName),
          ),
        ],
      ),
    );
  }
}
