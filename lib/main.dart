import 'package:bmi_app/methods/CalBmi.dart';
import 'package:bmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CalculateBMI(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
       scaffoldBackgroundColor: const Color(0xff0a0321),
       appBarTheme: const AppBarTheme(
        elevation: 0, 
        centerTitle: true,
        color:Color(0xff0a0321),
        ),
       textTheme: const TextTheme (
        displayLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 22),
        ),
      ),
      home: const HomeScreen(),
    ),
      );
  }
}

