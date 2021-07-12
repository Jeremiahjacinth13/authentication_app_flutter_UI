import 'package:authapp/constants.dart';
import 'package:flutter/material.dart';

class VerifyCodeField extends StatefulWidget {
  @override
  _VerifyCodeFieldState createState() => _VerifyCodeFieldState();
}

class _VerifyCodeFieldState extends State<VerifyCodeField> {
  int currentIndex = 0;

  List<String> verificationCode = ['', '', '', ''];

  TextEditingController controller0 = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  List<TextEditingController?> controllersList = [];

  @override
  void initState() {
    super.initState();
    controller0.addListener(() => _controlText(controller0));
    controller1.addListener(() => _controlText(controller1));
    controller2.addListener(() => _controlText(controller2));
    controller3.addListener(() => _controlText(controller3));
    controllersList = [controller0, controller1, controller2, controller3];
  }

  void dispose() {
    super.dispose();
    controller0.dispose();
  }

  void _controlText(TextEditingController controller) {
    print(controller.text);
    if (controller.text.length > 4) {
    } else {
      for (int i = 0; i < controller.text.length; i++) {
        controllersList[i]!.text = controller.text[i];
      }
    }
  }

  void _handleChange(String value) {
    print(value);
    if (value.length == 1) {
      setState(() {
        var oldVerificationCode = verificationCode;
        oldVerificationCode[currentIndex] = value;
        verificationCode = oldVerificationCode;
        currentIndex += currentIndex;
      });
    } else {
      setState(() {
        var oldVerificationCode = verificationCode;
        oldVerificationCode[currentIndex] = '';
        verificationCode = oldVerificationCode;
        currentIndex -= currentIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            VerifyCodeSpace(
              textController: controller0,
              parentCurrentIndex: currentIndex,
              privateIndex: 0,
            ),
            VerifyCodeSpace(
              textController: controller1,
              parentCurrentIndex: currentIndex,
              privateIndex: 1,
            ),
            VerifyCodeSpace(
              textController: controller2,
              parentCurrentIndex: currentIndex,
              privateIndex: 2,
            ),
            VerifyCodeSpace(
              textController: controller3,
              parentCurrentIndex: currentIndex,
              privateIndex: 3,
            )
          ],
        ),
      ],
    );
  }
}

class VerifyCodeSpace extends StatelessWidget {
  const VerifyCodeSpace(
      {Key? key,
      required this.textController,
      required this.parentCurrentIndex,
      required this.privateIndex})
      : super(key: key);

  final int parentCurrentIndex;
  final int privateIndex;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.width * 0.2,
      width: size.width * 0.2,
      decoration: BoxDecoration(
          color: kLightColor,
          borderRadius: BorderRadius.circular(10.0),
          border: parentCurrentIndex >= privateIndex
              ? Border.all(color: kPrimaryColor, width: 1.0)
              : null),
      child: TextField(
        controller: textController,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35.0,
        ),
        showCursor: false,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
