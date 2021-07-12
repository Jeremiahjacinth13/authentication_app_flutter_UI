import 'package:authapp/constants.dart';
import 'package:authapp/screens/forgot_password/forgot_password.dart';
import 'package:authapp/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:authapp/widgets/button.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            CustomTextField(
              text: 'Email Address',
              onChanged: (String value) => emailAddressController.text = value,
              validate: (String value) => {
                'isValid': value.length >= 10,
                'errorMessage': 'Email Address is not valid',
              },
            ),
            SizedBox(height: 10.0),
            CustomPasswordField(
              text: "Password",
              onChanged: (String value) => passwordController.text = value,
              validate: (String value) => {
                'isValid': value.length >= 10,
                'errorMessage': 'Password should have more than 8 characters',
              },
            ),
            TextButton(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                }),
            SizedBox(height: 10.0),
            CustomButton(text: "LOGIN", onPressed: () {}),
            SizedBox(height: 40.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('Don\'t have an account? ',
                  style: TextStyle(fontSize: 17.0, color: kTextColor)),
              GestureDetector(
                onTap: () {
                  print('this person does not have an account');
                },
                child: Text('Sign Up',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
            ]),
            SizedBox(height: 30.0),
            Row(children: <Widget>[
              Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('OR',
                    style: TextStyle(fontSize: 18.0, color: kTextColor)),
              ),
              Expanded(child: Divider())
            ]),
            SizedBox(height: 40.0),
            CompanySignInButton(
                company: "Google",
                iconSrc: "assets/icons/Groupicon_google.svg"),
            SizedBox(height: 10.0),
            CompanySignInButton(
                company: "Apple",
                iconSrc: "assets/icons/Apple_logo_black 1.svg"),
            SizedBox(height: 10.0),
            CompanySignInButton(
                company: "Facebook",
                iconSrc: "assets/icons/Facebook_icon_(black) 1.svg"),
          ]),
    );
  }
}
