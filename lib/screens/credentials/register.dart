import 'dart:developer' as developer;

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:trip_pal_null_safe/models/user.dart';
import 'package:trip_pal_null_safe/services/auth_service.dart';
import 'package:trip_pal_null_safe/utilities/error_handlers.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
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
  DateTime? birthday;
  int gender = 1;
  var error = '';
  var formattedDate = 'Birth Date';
  final _formatter = intl.DateFormat(intl.DateFormat.YEAR_ABBR_MONTH_DAY);
  final _formKey = GlobalKey<FormState>();
  bool inAsyncCall = false;

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
                child: ModalProgressHUD(
                  inAsyncCall: inAsyncCall,
                  child: Container(
                      margin: Spacing.only(left: 30.0, right: 30.0),
                      alignment: Alignment.center,
                      child: buildForm(context)),
                ),
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
                    hintStyle: TextStyle(color: Colors.white),
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
                    hintText: 'Last name',
                    hintStyle: TextStyle(color: Colors.white),
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
                hintStyle: TextStyle(color: Colors.white),
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
          buildDateTimeFormField(Get.theme, context),
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
                hintStyle: TextStyle(color: Colors.white),
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
              hintStyle: TextStyle(color: Colors.white),
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
                onPressed: onSignUpPressed),
          ),
          buildFormFooter(),
        ],
      ),
    );
  }

  Future<void> onSignUpPressed() async {
    setState(() {
      inAsyncCall = true;
    });
    FocusScope.of(Get.context!).unfocus();
    if (_formKey.currentState!.validate()) {
      try {
        await Get.find<AuthControl>().register(User(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          birthDate: birthday,
          gender: gender == 1 ? 'M' : 'F',
        ));
        Get.offAllNamed('/home');
      } on dio.DioError catch (e) {
        if (e.type == dio.DioErrorType.response) {
          switch (e.response!.statusCode) {
            case 400:
              {
                developer.log(e.response.toString(), name: '[LOGIN]');
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
        handelError(e, onSignUpPressed);
      }
    }
    setState(() {
      inAsyncCall = false;
    });
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

  Widget buildDateTimeFormField(ThemeData themeData, BuildContext context) {
    return FormField(
      validator: (_) {
        if (birthday == null) return 'Please select';
        return null;
      },
      builder: (state) {
        return GestureDetector(
            child: Container(
              margin: Spacing.only(top: 24, bottom: 24),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(formattedDate,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16)),
                    ],
                  ),
                  if (state.hasError) ...[
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          state.errorText!,
                          style: themeData.textTheme.caption!.copyWith(
                              color: themeData.errorColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
            onTap: () async {
              DateTime? _tmp = await showDatePicker(
                  initialEntryMode: DatePickerEntryMode.inputOnly,
                  context: context,
                  firstDate: DateTime.utc(1970),
                  lastDate: DateTime.now(),
                  initialDate: birthday != null ? birthday! : DateTime.now());
              if (_tmp != null) {
                setState(() {
                  birthday = _tmp;
                  formattedDate = _formatter.format(birthday!);
                });
              }
            });
      },
    );
  }
}
