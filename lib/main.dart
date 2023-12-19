import 'package:device_preview/device_preview.dart';
import 'package:erp_school/src/SplashScreen.dart';
import 'package:erp_school/src/provider/passwordVisibilityProvider.dart';
import 'package:erp_school/src/provider/splashScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    // ignore: prefer_const_literals_to_create_immutables
    // tools: [
    //   ...DevicePreview.defaultTools,
    //   const CustomPlugin(),
    // ],
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashScreenProvider()),
        ChangeNotifierProvider(
            create: (context) => PasswordVisibilityProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ERP School Student',
          theme: ThemeData(fontFamily: "SourceSansPro"),
          home: const SplashScreen()),
    );
  }
}
