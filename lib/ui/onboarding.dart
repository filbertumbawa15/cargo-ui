import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    onboarding();
  }

  void onboarding() async {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          )),
        ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 70.0),
                    Image.asset(
                      "assets/cargo-ui.png",
                      scale: 3.5,
                      width: 94.0,
                      height: 94.0,
                    ),
                    SizedBox(height: 6.0),
                    Container(
                        child: Center(
                            child: Column(
                      children: [
                        Container(
                            child: Text("Cargo App",
                                style: TextStyle(
                                    color: Color(0xFF212B46),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32.0))),
                      ],
                    ))),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
