import 'dart:async';

import 'package:erp_school/src/login.dart';
import 'package:erp_school/src/provider/splashScreenProvider.dart';
import 'package:erp_school/src/stackCheck.dart';
import 'package:erp_school/src/utilities/asset_images.dart';
import 'package:erp_school/src/utilities/mySize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        //debugPrint(user.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => StackCheck(email: user.email.toString())),
        );
      } else {
        debugPrint(user.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      }
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const Login()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<SplashScreenProvider>(
      builder: (context, value, child) {
        return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage(AssetImages.splashScreen),
                //     fit: BoxFit.cover)
                ),
            child:
                //value.isLoading
                //?
                Image.asset(
              AssetImages.splashScreen,
              fit: BoxFit.cover,
            )
            //: const Login(),
            );
      },
    ));
  }
}
