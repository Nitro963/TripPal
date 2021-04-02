import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/LogIn/login.dart';
import 'package:travel_app/scr/shared/services/validators.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';

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
    SizeConfig.init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              Image.asset(
                'images/sign up-mod.jpg',
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 47 * SizeConfig.blockSizeVertical,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.025),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(top: 30.0),
                                child: Text(
                                  'Welcome, \nSign Up to get started',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                        hintText: 'First name',
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      ),
                                      validator: (val) => val.isEmpty
                                          ? "Please fill your first name"
                                          : null,
                                      onChanged: (val) {
                                        setState(() => firstName = val);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                          hintText: 'Last name'),
                                      validator: (val) => val.isEmpty
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
                                decoration: InputDecoration(
                                    hintText: 'Email Address',
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
                                decoration: InputDecoration(
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
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Re-type password',
                                    prefixIcon: Icon(
                                      Icons.lock_outlined,
                                      color: Colors.white,
                                    )),
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
                                height: 7 * SizeConfig.blockSizeVertical,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 4,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: RaisedButton(
                                    color: const Color(0xff1368b8),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                    onPressed: () async {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      if (_formKey.currentState.validate()) {
                                        // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                        // if(result == null) {
                                        //   setState(() {
                                        //     error = 'Could not sign in with those credentials';
                                        //   });
                                        // }
                                      }
                                    }),
                              ),
                              Column(
                                children: [
                                  Text('Sign up With Social Account',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.0)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Row(
                                        children: [
                                          RaisedButton(
                                              onPressed: () {},
                                              color: const Color(0xff3b5998),
                                              textColor: Colors.white,
                                              child: Icon(
                                                FontAwesomeIcons.facebookF,
                                                size: 30,
                                              ),
                                              padding: EdgeInsets.all(16),
                                              shape: CircleBorder()),
                                          RaisedButton(
                                              onPressed: () {},
                                              color: const Color(0xff2ca7e0),
                                              textColor: Colors.white,
                                              child: Icon(
                                                FontAwesomeIcons.twitter,
                                                size: 30,
                                              ),
                                              padding: EdgeInsets.all(16),
                                              shape: CircleBorder())
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Already have an account?',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.0)),
                                  CupertinoButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Login',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.white,
                                            fontSize: 17.0)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
