import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_geofencing/controllers/providers/home_screen_provider.dart';
import 'package:interview_geofencing/controllers/providers/login_screen_provider.dart';
import 'package:interview_geofencing/views/home_screen.dart';
import 'package:interview_geofencing/views/login_screen.dart';
import 'package:interview_geofencing/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});




final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>const SplashScreen(),
    ),
     GoRoute(
      path: '/home',
      builder: (context, state) =>const HomeScreen(),
    ),
     GoRoute(
      path: '/login',
      builder: (context, state) =>const LoginScreen(),
    ),
     
  ],
);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context)=> LoginScreenProvider())
      ],
      child: MaterialApp.router(
      
        debugShowCheckedModeBanner: false,
         routerConfig: router,
        // home:  SplashScreen(),
      ),
    );
  }






}
