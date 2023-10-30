import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_geofencing/controllers/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Yes, exit'),
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  ),
                ],
              );
            });

        return value == true;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
        body: Center(
          child: Consumer<HomeScreenProvider>(builder: (context, pro, value) {
            return GestureDetector(
                onTap: () {
                    if (pro.status == false) {
                    pro.getLocation();
                  } else {
                    pro.stopFencing();
                  }
                  pro.statusChange(pro.status);
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(100),
                    color: pro.geofencingStatus == true
                        ? const Color.fromARGB(255, 83, 158, 86)
                            .withOpacity(0.9)
                        : const Color.fromARGB(255, 183, 85, 60)
                            .withOpacity(0.9),
                  ),
                  child: Center(
                    child: Text(
                      pro.status == false ? "START" : "STOP",
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ));
          }),
        ),
      ),
    );
  }
}
