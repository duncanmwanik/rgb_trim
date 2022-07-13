import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rgb_trim/custom_color_circle_picker/custom_circle_color_picker.dart';
import 'package:flutter_blue/flutter_blue.dart';

// Initializing a global key, as it would help us in showing a SnackBar later
final GlobalKey<ScaffoldState> scaffoldKeyHome = new GlobalKey<ScaffoldState>();
double h;
double w;

FlutterBlue fb = FlutterBlue.instance;
bool btstate = false;

BluetoothDevice device;
String serviceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
String charaCteristicUuid = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
BluetoothCharacteristic c;
bool connected = false;
Stream<List<int>> stream;

// variables to keep different selections realtime// selected pattern
String selection = ""; // selected color-circle color
final colorController = CircleColorPickerController(
  initialColor: Colors.white,
);

// container decoration, frequently used
Decoration deco = BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    color: Colors.white10,
    boxShadow: [
      BoxShadow(offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)
    ]);

sendTransparentData(String dataString) async {
  //Encoding the string
  List<int> data = utf8.encode(dataString);
  print(data);
  try {
    await c.write(data);
    print("::::::::: SUCCESS! SEND DATA : $dataString");
  } catch (e) {
    print("::::::::: FAILED TO SEND DATA : $dataString");
    print(e);
  }
}
