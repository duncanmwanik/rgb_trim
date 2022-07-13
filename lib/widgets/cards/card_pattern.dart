// Pattern widget
import 'package:flutter/material.dart';
import 'package:rgb_trim/objects/objects.dart';

class PatternCard extends StatelessWidget {
  const PatternCard({Key key, this.pattern}) : super(key: key);
  final PatternList pattern;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            pattern.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
