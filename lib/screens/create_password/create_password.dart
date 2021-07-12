import 'package:authapp/constants.dart';
import 'package:authapp/screens/create_profile/create_profile.dart';
import 'package:authapp/widgets/button.dart';
import 'package:authapp/widgets/input_fields.dart';
import 'package:flutter/material.dart';

class CreatePasswordScreen extends StatelessWidget {
  static String routeName = '/create_password';

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black87,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15.0),
            Text(
              'Create Password',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 30.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 5.0),
            Container(
              child: Text(
                "Create a new password to login",
                style: TextStyle(
                    fontSize: 20.0,
                    color: kTextColor.withOpacity(0.9),
                    height: 1.5),
              ),
            ),
            SizedBox(height: 40.0),
            CustomPasswordField(
              text: "Enter New Password",
              onChanged: (String value) => passwordController.text = value,
              validate: (value) => validate(value, passwordController.text,
                  confirmPasswordController.text),
            ),
            SizedBox(height: 10.0),
            CustomPasswordField(
              text: "Enter Password again",
              onChanged: (String value) =>
                  confirmPasswordController.text = value,
              validate: (value) => validate(value, passwordController.text,
                  confirmPasswordController.text),
            ),
            SizedBox(height: 30.0),
            CustomButton(
                text: "CREATE PASSWORD",
                onPressed: () {
                  Navigator.pushNamed(context, CreateProfileScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }
}

validate(String value, String password, String confirmPassword) {
  bool? isValid;
  String errorMessage = '';
  if (value.length < 10) {
    isValid = false;
    errorMessage = 'Password should have more than 8 characters';
  } else if (password != confirmPassword) {
    isValid = false;
    errorMessage = 'Passwords do not match';
  } else {
    isValid = true;
  }
  return {'isValid': isValid, 'errorMessage': errorMessage};
}
