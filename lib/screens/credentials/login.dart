import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:trip_pal_null_safe/controllers/apps_controllers.dart';
import 'package:trip_pal_null_safe/screens/home/users_list.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/error_handlers.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
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
                child: ModalProgressHUD(
                  inAsyncCall: inAsyncCall,
                  child: Container(
                      margin: Spacing.symmetric(horizontal: 30),
                      child: buildForm(context)),
                ),
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
              Get.find<AuthControl>().activateGuestMode();
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
                onPressed: () {
                  Get.put<UsersListController>(UsersListController());
                  Get.to(() => UsersList());
                },
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

  bool inAsyncCall = false;

  void onLoginPressed() async {
    setState(() {
      inAsyncCall = true;
    });
    FocusScope.of(Get.context!).unfocus();
    if (_formKey.currentState!.validate()) {
      try {
        await Get.find<AuthControl>().login(email: email, password: password);
        Get.offAllNamed('/home');
      } on dio.DioError catch (e) {
        if (e.type == dio.DioErrorType.response) {
          switch (e.response!.statusCode) {
            case 400:
              {
                Get.showSnackbar(
                  buildErrorSnackBar(
                    'Wrong email or password. Try again or click Forgot Password to reset it.',
                    position: SnackPosition.TOP,
                    margin: EdgeInsets.only(top: 20),
                    duration: Duration(seconds: 4),
                  ),
                );
                setState(() {
                  inAsyncCall = false;
                });
                return;
              }
          }
        }
        handelError(e, onLoginPressed);
      }
    }
    setState(() {
      inAsyncCall = false;
    });
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
