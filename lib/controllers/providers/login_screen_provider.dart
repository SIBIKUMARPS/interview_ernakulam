// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_geofencing/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenProvider extends ChangeNotifier {
  Position? curentPosition;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  getLocation() async {
    curentPosition = await Geolocator.getCurrentPosition();
     notifyListeners();
  }

  loginCredentials(BuildContext context) async {
    if (usernameController.text == "sibi" && passwordController.text == "1234"){
          SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('token', "token");

             context.go('/home');
    }
    else{
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('You Enterd a Wrong Username or Password'),
          backgroundColor: Colors.red,
        ));

    }
  }
}
