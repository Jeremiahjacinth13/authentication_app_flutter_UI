import 'package:authapp/constants.dart';
import 'package:authapp/screens/create_password/create_password.dart';
import 'package:authapp/widgets/button.dart';
import 'package:authapp/widgets/verify_code.dart';
import 'package:flutter/material.dart';

class VerifyPasswordScreen extends StatelessWidget {
  static String routeName = '/verify_password';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              'Enter Verification Code',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 30.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: size.width * 0.9,
              child: RichText(
                text: TextSpan(
                  text:
                      'Enter the four-digits code that we have sent to your email',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: kTextColor.withOpacity(0.9),
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' jerexxx@gmail.com.',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black87))
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0),
            VerifyCodeField(),
            SizedBox(height: 50.0),
            CustomButton(
              text: "VERIFY",
              onPressed: () {
                Navigator.pushNamed(context, CreatePasswordScreen.routeName);
              },
            ),
            TextButton(
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 60)),
              ),
              child: Text(
                'Resend Code',
                textAlign: TextAlign.center,
                style: TextStyle(color: kPrimaryColor, fontSize: 18.0),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
