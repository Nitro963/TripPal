import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/shared/constants.dart';

class Login2 extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login2> {
  var email = '';
  var password = '';
  var error = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffefdae5),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop),
                  image: new AssetImage('images/4-crop.jpg'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                        Colors.white.withOpacity(0.2),
                        const Color(0xffAE347B),
                        const Color(0xff04045A),
                      ],
                      stops: [
                        0.2,
                        0.6,
                        1
                      ]),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 45, left: 30, right: 30),
                child: Column(
                  children: [
                    Text(
                      'Turn your trip into an adventure.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    Spacer(flex: 2),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.alternate_email_sharp,
                            color: Colors.white,
                          )),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your Email Address' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
                      validator: (val) => val.length < 8
                          ? 'Enter a password 8+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 45.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                        child: RaisedButton(
                            color: const Color(0xff1368b8),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                            onPressed: () async {
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
                    ),
                    SizedBox(height: 40.0),
                    Column(
                      children: [
                        Text('Login With Social Account',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0)),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Row(children: [
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
                          ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30, top: 30, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.0)),
                          CupertinoButton(
                            onPressed: () {},
                            child: Text('SIGN UP',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 17.0)),
                          ),
                        ],
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
          ],
        ));
  }
}
