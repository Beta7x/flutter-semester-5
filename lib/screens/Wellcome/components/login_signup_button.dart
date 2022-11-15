import 'package:flutter/material.dart';
import 'package:flutter_admin/utils/config.dart';
import 'package:flutter_admin/screens/Login/login_screen.dart';
import 'package:flutter_admin/screens/Signup/signup_screen.dart';

class LoginAndSignUpButton extends StatelessWidget {
  const LoginAndSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_button",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: Text("masuk".toUpperCase()),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryLightColor,
            elevation: 0,
          ),
          child: Text(
            "Daftar".toUpperCase(),
            style: TextStyle(color: Colors.grey[800]),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
