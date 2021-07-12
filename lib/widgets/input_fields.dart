import 'package:authapp/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key, required this.text, required this.onChanged, this.validate})
      : super(key: key);

  final String text;
  final Function(String) onChanged;
  final Function(String)? validate;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (String value) {
          widget.onChanged(value);
          var error = widget.validate!(value);
          if (error['isValid']) {
            setState(() {
              _errorText = null;
            });
          } else {
            setState(() {
              _errorText = error['errorMessage'];
            });
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          errorText: _errorText,
          errorStyle: TextStyle(
            fontSize: 14.0,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
          fillColor:
              _errorText == null ? Color(0xffEBF3F9) : Colors.red.shade100,
          filled: true,
          contentPadding: EdgeInsets.all(kDefaultPadding),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.red.shade400)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 1.0)),
          labelText: widget.text,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400, width: 1.0)),
        ));
  }
}

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {Key? key, required this.text, required this.onChanged, this.validate})
      : super(key: key);

  final String text;
  final Function(String) onChanged;
  final Function(String)? validate;

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isVisible = true;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (String value) {
          widget.onChanged(value);
          var error = widget.validate!(value);
          if (error['isValid']) {
            setState(() {
              _errorText = null;
            });
          } else {
            setState(() {
              _errorText = error['errorMessage'];
            });
          }
        },
        obscureText: _isVisible,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 14.0),
          errorText: _errorText,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: kPrimaryColor)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.red.shade400)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.red.shade400)),
          filled: true,
          fillColor:
              _errorText == null ? Color(0xffEBF3F9) : Colors.red.shade100,
          suffixIcon: GestureDetector(
            child: _isVisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            onTap: () => setState(() {
              _isVisible = !_isVisible;
            }),
          ),
          contentPadding: EdgeInsets.all(kDefaultPadding),
          labelText: widget.text,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none),
        ));
  }
}
