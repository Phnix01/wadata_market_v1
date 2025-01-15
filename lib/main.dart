import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_shop_v1/screens/home_screen.dart';

void main() {
  //Do this in main.dart
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.amber),
      home: HomeScreen(),
    );
  }
}
