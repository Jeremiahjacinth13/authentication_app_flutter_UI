import 'package:flutter/material.dart';
import 'package:authapp/constants.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 60)),
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18.0)),
      onPressed: onPressed,
    );
  }
}

class CompanySignInButton extends StatelessWidget {
  const CompanySignInButton(
      {Key? key, required this.company, required this.iconSrc})
      : super(key: key);
  final String company, iconSrc;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: kTextColor.withOpacity(0.6), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.2,
              vertical: kDefaultPadding * 0.8),
          child: Row(
            children: <Widget>[
              SvgPicture.asset(iconSrc),
              Expanded(
                child: Text(
                  company,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
