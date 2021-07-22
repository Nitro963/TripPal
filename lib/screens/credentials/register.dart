import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/validators.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var email = '';
  var password = '';
  var firstName = '';
  var lastName = '';
  var error = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              buildBackground(),
              SafeArea(
                child: Container(
                    margin: Spacing.only(left: 30.0, right: 30.0),
                    alignment: Alignment.center,
                    child: buildForm(context)),
              ),
            ],
          ),
        ));
  }

  Form buildForm(context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildFormHeader(),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'First name',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    errorStyle: TextStyle(color: Colors.orange),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  validator: (val) => val == null || val.isEmpty
                      ? "Please fill your first name"
                      : null,
                  style: TextStyle(color: Colors.white),
                  onChanged: (val) {
                    setState(() => firstName = val);
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.orange),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: 'Last name',
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                  ),
                  validator: (val) => val == null || val.isEmpty
                      ? "Please fill your last name"
                      : null,
                  onChanged: (val) {
                    setState(() => lastName = val);
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                hintText: 'Email Address',
                errorStyle: TextStyle(color: Colors.orange),
                prefixIcon: Icon(
                  FontAwesomeIcons.at,
                  color: Colors.white,
                )),
            validator: validateEmail,
            onChanged: (val) {
              setState(() => email = val);
            },
          ),
          TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.orange),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: Colors.white,
                )),
            validator: validatePassword,
            onChanged: (val) {
              setState(() => password = val);
            },
          ),
          TextFormField(
            style: TextStyle(color: Colors.white),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Re-type password',
              errorStyle: TextStyle(color: Colors.orange),
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.white,
              ),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
            ),
            validator: (val) {
              var ret = validatePassword(val);
              if (ret != null) return ret;
              if (val != password) {
                return 'Those passwords did not match. Try again.';
              }
              return null;
            },
          ),
          Container(
            width: double.infinity,
            height: MySize.getScaledSizeHeight(50),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
            child: ElevatedButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState!.validate()) {
                    // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    // if(result == null) {
                    //   setState(() {
                    //     error = 'Could not sign in with those credentials';
                    //   });
                    // }
                  }
                }),
          ),
          buildFormFooter(),
        ],
      ),
    );
  }

  Widget buildFormFooter() {
    return Container(
      child: Column(
        children: [
          Text('Sign up With Social Account',
              style: TextStyle(color: Colors.white, fontSize: 17.0)),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Row(children: [
              MaterialButton(
                  onPressed: () {},
                  color: const Color(0xff3b5998),
                  textColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.facebookF,
                    size: 30,
                  ),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder()),
              MaterialButton(
                  onPressed: () {},
                  color: const Color(0xff2ca7e0),
                  textColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    size: 30,
                  ),
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder())
            ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Already have an account?',
                  style: TextStyle(color: Colors.white, fontSize: 17.0)),
              CupertinoButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Login',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 17.0)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildFormHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        'Welcome, \nSign Up to get started',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Stack buildBackground() {
    return Stack(children: [
      Image.asset(
        'assets/images/sign up-mod.jpg',
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MySize.screenHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.05),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
