// Color widget
import 'package:flutter/material.dart';
import 'package:rgb_trim/objects/objects.dart';

class ColorssCard extends StatelessWidget {
  const ColorssCard({Key key, this.colorss}) : super(key: key);
  final ColorsList colorss;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: colorss.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center());
  }
}
