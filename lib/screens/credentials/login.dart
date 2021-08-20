import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/validators.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = '';
  var password = '';
  final _formKey = GlobalKey<FormState>();

  Widget buildBackground(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/wl-mod-2.jpg',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 2 * MySize.screenHeight / 3,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.7),
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
      ],
    );
  }

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
              buildBackground(context),
              SafeArea(
                child: Container(
                    margin: Spacing.symmetric(horizontal: 30),
                    child: buildForm(context)),
              ),
            ],
          ),
        ));
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildFormHeader(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MySize.getScaledSizeHeight(24)),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.orange),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      prefixIcon: Icon(
                        FontAwesomeIcons.at,
                        color: Colors.white,
                      )),
                  validator: validateEmail,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: MySize.getScaledSizeHeight(24)),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.orange),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.white,
                      )),
                  validator: validatePassword,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: MySize.getScaledSizeHeight(36)),
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
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      onPressed: onLoginPressed),
                ),
                buildFormFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildFormFooter() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
            onPressed: () {
              Get.toNamed('/password-reset');
            },
            child: Text('Forgot your password?',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 17.0)),
          ),
          CupertinoButton(
            onPressed: () async {
              Get.find<AuthControl>().currentUser =
                  User(firstName: 'Guest', email: 'guest@trippal.com');
              Get.offAllNamed('/home');
            },
            child: Text('Login as Guest?',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 17.0)),
          ),
          Text('Login With Social Account',
              style: TextStyle(color: Colors.white, fontSize: 17.0)),
          Row(children: [
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
                shape: CircleBorder()),
          ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Don\'t have an account?',
                  style: TextStyle(color: Colors.white, fontSize: 17.0)),
              CupertinoButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: Text('SIGN UP',
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

  void onLoginPressed() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      // if(result == null) {
      // var error =
      //     'Could not login with those credentials';
      // _scaffoldKey.currentState
      //     .showSnackBar(SnackBar(
      //   duration: new Duration(seconds: 2),
      //   content: new Text(
      //     error,
      //     style: TextStyle(color: Colors.red),
      //   ),
      // ));
      // }
      // Get.to(() => PlaceDetails());
    }
  }

  Container buildFormHeader() {
    return Container(
      margin: Spacing.only(top: 30),
      child: Text(
        'Turn your trip into an adventure.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 19,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
