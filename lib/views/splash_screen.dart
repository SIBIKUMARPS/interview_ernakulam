import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_geofencing/views/home_screen.dart';
import 'package:interview_geofencing/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      body: Center(
          child: Text(
        "GEO FENCING APP",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }

  @override
  void didChangeDependencies() {
    checklogin(context);
    super.didChangeDependencies();
  }
}

void checklogin(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await Future.delayed(const Duration(seconds: 2));
  String? token = preferences.getString('token');
  if (token == null) {
    context.go('/login');
    

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const LoginScreen()),
    // );
  } else {

    context.go('/home');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomeScreen()),
    // );
  }
}
