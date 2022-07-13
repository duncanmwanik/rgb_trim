import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:rgb_trim/global.dart';
import 'package:rgb_trim/screens/devices_screen.dart';
import 'package:rgb_trim/widgets/notify/alert_notification.dart';

// ignore: must_be_immutable
class DevicePicker extends StatefulWidget {
  @override
  _DevicePickerState createState() => _DevicePickerState();
}

class _DevicePickerState extends State<DevicePicker> {
  // Disconnect from a device
  disconnectFromDevice() async {
    try {
      await device.disconnect();
      setState(() {
        device = null;
        connected = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        device = null;
        connected = false;
      });
      NotifyUser().error(context, "Tiny error disconnecting...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1),
        margin: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
        decoration: deco,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: ElevatedButton(
                onPressed: () async {
                  if (connected) { // if a device is already connected
                    NotifyUser()
                        .success(context, "Disconnect current device first...");
                  } else if (btstate) { // check if BT is on
                    // Start scanning for availabele BLE devices
                    FlutterBlue.instance
                        .startScan(timeout: Duration(seconds: 4));
                    // Go to devices screen to connect a device
                    BluetoothDevice dev = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DevicesScreen()),
                    );
                    if (dev != null) {
                      setState(() {
                        connected = true;
                        device = dev;
                      });
                      NotifyUser().success(context, "Connected!");
                      

                      // check if device gets disconnected externally
                      dev.state.listen((event) {
                        if (event == BluetoothDeviceState.disconnected) {
                          setState(() {
                            device = null;
                            connected = false;
                          });
                          NotifyUser()
                              .success(context, "Lost connection to device!");
                        }
                      });
                    }
                  } else {
                    NotifyUser().error(context, "Bluetooth is off!");
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff202020), // background (button) color
                    onPrimary: Colors.white, // foreground (text) color
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    )),
                child: Text(
                  connected ? device.name : "Tap to connect a device",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Visibility(
              visible: connected,
              child: Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: (() => disconnectFromDevice()),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background (button) color
                      onPrimary: Colors.white, // foreground (text) color
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      )),
                  child: Text(
                    'Disconnect',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
