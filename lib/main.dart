import 'package:flutter/material.dart';
import 'package:tideapp/src/routes/router.dart';
import 'package:tideapp/src/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Post',
      theme: appTheme,
      routes: appRouter,
      initialRoute: '/',
    );
  }
}
