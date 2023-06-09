import 'package:ecommerce/dashBoard.dart';
import 'package:ecommerce/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static SharedPreferences? prefs;

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forSharePrefs();
  }

  bool isLogin = false;

  forSharePrefs() async {
    SplashScreen.prefs = await SharedPreferences.getInstance();
    setState(() {
      isLogin = SplashScreen.prefs!.getBool("loginStatus") ?? false;
    });

    Future.delayed(Duration(seconds: 3)).then((value) {
      if (isLogin) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DashBoard();
          },
        ));
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "E-Commerce App",
        style: TextStyle(color: Colors.white),
      )),
      backgroundColor: Colors.blue,
    );
  }
}
