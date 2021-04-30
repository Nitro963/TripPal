import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/shared/services/validators.dart';

// TODO change to indexed stack or NeverScrollable PageView

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  var email = '';
  var verificationCode = '';
  var newPassword = '';
  var stage = 0;
  final _formKey = GlobalKey<FormState>();
  final emailFieldKey = UniqueKey();
  final verificationFieldKey = UniqueKey();

  Widget buildFirstSage(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        key: emailFieldKey,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 2),
          hintText: 'Email Address',
        ),
        validator: validateEmail,
        onChanged: (val) {
          setState(() => email = val);
        },
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 3),
      ElevatedButton(
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          onPressed: () async {
            // FocusScope.of(context).requestFocus(FocusNode());
            if (_formKey.currentState.validate()) {
              // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
              // if(result == null) {
              //   setState(() {
              //     error = 'Could not sign in with those credentials';
              //   });
              // }
              setState(() => stage++);
            }
          })
    ]);
  }

  Widget buildSecondSage(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        key: verificationFieldKey,
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 2),
          hintText: 'Verification code',
        ),
        onChanged: (val) {
          setState(() => verificationCode = val);
        },
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 3),
      ElevatedButton(
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          onPressed: () async {
            // FocusScope.of(context).requestFocus(FocusNode());
            if (_formKey.currentState.validate()) {
              // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
              // if(result == null) {
              //   setState(() {
              //     error = 'Could not sign in with those credentials';
              //   });
              // }
              setState(() => stage++);
            }
          })
    ]);
  }

  Widget buildThirdSage(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        autofocus: true,
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 2),
          hintText: 'New password',
        ),
        onChanged: (val) {
          setState(() => newPassword = val);
        },
        validator: validatePassword,
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 3),
      TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 2),
          hintText: 'Re-type password',
        ),
        validator: (val) {
          var ret = validatePassword(val);
          if (ret != null) return ret;
          if (val != newPassword) {
            return 'Those passwords did not match. Try again.';
          }
          return null;
        },
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 3),
      ElevatedButton(
          child: Text(
            'Finish',
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          onPressed: () async {
            // FocusScope.of(context).requestFocus(FocusNode());
            if (_formKey.currentState.validate()) {
              // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
              // if(result == null) {
              //   setState(() {
              //     error = 'Could not sign in with those credentials';
              //   });
              // }
              print('Send to Home screen');
            }
          })
    ]);
  }

  Widget buildStageInputs(BuildContext context) {
    switch (stage) {
      case 0:
        return buildFirstSage(context);
      case 1:
        return buildSecondSage(context);
      case 2:
        return buildThirdSage(context);
      default:
        return SizedBox(height: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/password-reset.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reset your password',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.blueGrey.shade900)),
                  SizedBox(height: SizeConfig.blockSizeVertical * 5),
                  Center(
                      child: Form(
                          key: _formKey, child: buildStageInputs(context))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordResetController extends GetxController {
  RxString _email = ''.obs;
  RxString _verificationCode = ''.obs;
  RxString _newPassword = ''.obs;
  RxInt _stage = 0.obs;

  int get stage => _stage.value;
  String get email => _email.value;
  String get verificationCode => _verificationCode.value;
  String get newPassword => _newPassword.value;

  void setEmail(String val) {
    _email.value = val;
  }

  void setVerificationCode(String val) {
    _verificationCode.value = val;
  }

  void setNewPassword(String val) {
    _newPassword.value = val;
  }

  void proceed() {
    _stage++;
  }

  void back() {
    _stage--;
  }
}
