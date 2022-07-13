import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:rgb_trim/global.dart';
import 'package:rgb_trim/widgets/notify/alert_notification.dart';

// ignore: must_be_immutable
class DevicesScreen extends StatefulWidget {
  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  connectToDevice(BluetoothDevice d) async {
    await d.connect(autoConnect: false);
    discoverServices(d);
  }

  discoverServices(BluetoothDevice d) async {
    List<BluetoothService> services = await d.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == serviceUuid) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == charaCteristicUuid) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;
            c = characteristic;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff101010),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Devices',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // A list of all BLE devices that are advertising
          StreamBuilder<List<ScanResult>>(
            stream: FlutterBlue.instance.scanResults,
            initialData: [],
            builder: (c, snapshot) => Column(
              children: snapshot.data.map((r) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.black38,
                            blurRadius: 4)
                      ]),
                  child: ListTile(
                    title: Text(
                      r.device.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        try {
                          connectToDevice(r.device);
                          Navigator.pop(context, r.device);
                        } catch (e) {
                          print(e);
                          NotifyUser()
                              .error(context, "Failed to connect to device!");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          // minimumSize: Size(w * 0.9, h * 0.08),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          )),
                      child: Text(
                        "Connect",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () {
                  if (btstate)
                    FlutterBlue.instance
                        .startScan(timeout: Duration(seconds: 4));
                  else
                    NotifyUser().error(context, "Bluetooth is off!");
                });
          }
        },
      ),
    );
  }
}
