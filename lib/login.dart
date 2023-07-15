import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  final _formKey = new GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(36, 43, 47, 1),
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(    // new line
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildFirstName(),
                    _buildLastName(),
                    _buildEmail(),
                    _buildPassword(),
                    _buildConfirmPassword(),
                    _buildSignUpButton(context)
                  ],
                ),
              ),
            ),
          ),
        ));
  }


  Widget _buildFirstName() {
    return TextFormField(
      validator: (value) =>
      value.isEmpty ? "First name cannot be empty" : null,
      style: TextStyle(
          color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("First name", 'assets/ic_worker.png'),
    );
  }

  Widget _buildLastName() {
    return Container(
        margin: const EdgeInsets.only(left: 40),
        child: TextFormField(
          validator: (value) =>
          value.isEmpty ? "Last name cannot be empty" : null,
          style: TextStyle(
              color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
          decoration: _buildInputDecoration("Last name", ''),
        ));
  }

  Widget _buildEmail() {
    return TextFormField(
      validator: (value) => !isEmail(value) ? "Sorry, we do not recognize this email address" : null,
      style: TextStyle(
          color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
      decoration: _buildInputDecoration("Email", 'assets/ic_email.png'),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      validator: (value) =>
      value.length <= 6 ? "Password must be 6 or more characters in length" : null,
      style: TextStyle(
          color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("Password", 'assets/ic_password.png'),
    );
  }
  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(regex);

    return value.isNotEmpty && regExp.hasMatch(value);
  }

  Widget _buildConfirmPassword() {
    return Container(
        margin: const EdgeInsets.only(left: 40),
        child: TextFormField(
          obscureText: true,
          validator: (value) => value.isEmpty ||
              (value.isNotEmpty && value != _passwordController.text)
              ? "Must match the previous entry"
              : null,
          style: TextStyle(
              color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
          decoration: _buildInputDecoration("Confirm password", ''),
        ));
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 43.0),
      width: MediaQuery.of(context).size.width * 0.62,
      child: RaisedButton(
        child: const Text(
          "Sign Up",
          style: TextStyle(
              color: Color.fromRGBO(40, 48, 52, 1),
              fontFamily: 'RadikalMedium',
              fontSize: 14),
        ),
        color: Colors.white,
        elevation: 4.0,
        onPressed: () {
//          _validateAndSubmit();
        },
      ),
    );
  }
}

InputDecoration _buildInputDecoration(String hint, String iconPath) {
  return InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(252, 252, 252, 1))),
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(151, 151, 151, 1))),
      hintStyle: TextStyle(color: Color.fromRGBO(252, 252, 252, 1)),
      icon: iconPath != '' ? Image.asset(iconPath) : null,
      errorStyle: TextStyle(color: Color.fromRGBO(248, 218, 87, 1)),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(248, 218, 87, 1))),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(248, 218, 87, 1))));
}