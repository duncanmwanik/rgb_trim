import 'package:flutter/material.dart';
import 'package:rgb_trim/home.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  var goToApp;

  goToApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Rgb Trim',
    home: HomeScreen(),
  );

  runApp(goToApp);
}
