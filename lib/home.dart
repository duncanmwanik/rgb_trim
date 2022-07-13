import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:rgb_trim/global.dart';
import 'package:rgb_trim/screens/colors_and_patterns.dart';
import 'package:rgb_trim/widgets/appbar/appbar.dart';
import 'package:rgb_trim/screens/device_picker.dart';
import 'package:rgb_trim/widgets/notify/alert_notification.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    // Get current state of Bluetooth and listen for state changes
    FlutterBlue.instance.state.listen((event) {
      if (event == BluetoothState.on) {
        setState(() => btstate = true);
      }
      if (event == BluetoothState.off) {
        setState(() => btstate = false);
        NotifyUser().error(context, "Bluetooth is off!");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Get device dimensions and set them globally
  setDeviceSize(context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = MediaQuery.of(context).size.width;
    setState(() {
      h = h1;
      w = w1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get device dimensions and set them globally
    setDeviceSize(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff101010),
      key: scaffoldKeyHome,
      appBar: MyAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // Connecting to devices
            DevicePicker(),

            // Colors and patterns buttons
            ColorsPatterns(),
          ],
        ),
      ),
    );
  }
}
