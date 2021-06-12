import 'package:flutter/material.dart';
import 'package:testing_http_function/register_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage()
    );
  }
}
