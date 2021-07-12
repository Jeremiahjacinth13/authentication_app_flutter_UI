import 'package:authapp/constants.dart';
import 'package:authapp/screens/notify_topics/notify_topics.dart';
import 'package:authapp/widgets/appbar_with_navigation.dart';
import 'package:authapp/widgets/button.dart';
import 'package:authapp/widgets/input_fields.dart';
import 'package:flutter/material.dart';

class CreateProfileScreen extends StatelessWidget {
  static String routeName = '/create_profile';
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(context, 0),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15.0),
                Text(
                  'Create Profile',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 30.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Text(
                    "Provide your profile picture and display name to join the community",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: kTextColor.withOpacity(0.9),
                        height: 1.5),
                  ),
                ),
                SizedBox(height: 60.0),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: kLightColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Image.asset("assets/icons/Camera.png"),
                      ),
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kPrimaryColor),
                          alignment: Alignment.center,
                          height: 30.0,
                          width: 30.0,
                          child: Text(
                            '+',
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                          ),
                        ),
                        right: 0.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.0),
                CustomTextField(
                  text: "Display Name",
                  onChanged: (value) {},
                  validate: (String value) => {
                    'isValid': value.length >= 8,
                    'errorMessage':
                        'Username should have more than 8 characters',
                  },
                ),
                SizedBox(height: 30.0),
                CustomButton(
                    text: "CREATE PROFILE",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, NotificationAccept.routeName);
                    }),
              ],
            ),
          ),
        ));
  }
}
