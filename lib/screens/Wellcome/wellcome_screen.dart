import 'package:flutter/material.dart';
import 'package:flutter_admin/components/background.dart';
import 'package:flutter_admin/screens/Home/home_screen.dart';
import 'package:flutter_admin/screens/Wellcome/components/login_signup_button.dart';
import 'package:flutter_admin/screens/Wellcome/components/welcome_image.dart';
import 'package:flutter_admin/utils/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  void homeNavigator() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
      ),
      (route) => false,
    );
  }

  void ceckLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin) {
      homeNavigator();
    }
  }

  @override
  void initState() {
    ceckLogin();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            mobile: const MobileWelcomeScreen(),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(child: WelcomeImage()),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignUpButton(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignUpButton(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
