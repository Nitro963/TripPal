import 'package:flutter/material.dart';

class RegisterBackground extends StatelessWidget {
  const RegisterBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/sign up-mod.jpg',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height,
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
      ],
    );
  }
}
