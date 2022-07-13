import 'package:flutter/material.dart';

class ColorsList {
  const ColorsList({this.title, this.color, this.hex});
  final String title;
  final Color color;
  final String hex;
}

const List<ColorsList> colorsList = const <ColorsList>[
  const ColorsList(
      title: 'Red', color: Color.fromRGBO(255, 0, 0, 1.0), hex: "0xff0000"),

  const ColorsList(
      title: 'Green', color: Color.fromRGBO(0, 255, 0, 1.0), hex: "0x00ff00"),

  const ColorsList(
      title: 'Blue', color: Color.fromRGBO(0, 0, 255, 1.0), hex: "0x0000ff"),

  const ColorsList(
      title: 'White',
      color: Color.fromRGBO(255, 255, 255, 1.0),
      hex: "0xffffff"),

  const ColorsList(
      title: 'Pink', color: Color.fromRGBO(255, 0, 86, 1.0), hex: "0xff0056"),

  const ColorsList(
      title: 'Orange',
      color: Color.fromRGBO(255, 165, 0, 1.0),
      hex: "0xffa500"),

  ///
  const ColorsList(
      title: 'Indigo', color: Color.fromRGBO(75, 0, 130, 1.0), hex: "0x4b0082"),

  const ColorsList(
      title: 'Yellow',
      color: Color.fromRGBO(255, 255, 0, 1.0),
      hex: "0xffff00"),

  const ColorsList(
      title: 'Aqua', color: Color.fromRGBO(0, 255, 255, 1.0), hex: "0x00ffff"),

  const ColorsList(
      title: 'Kawabanga',
      color: Color.fromRGBO(255, 0, 17, 1.0),
      hex: "0xff0011"),

  const ColorsList(title: 'Black', color: Colors.black, hex: "0x000000"),

  const ColorsList(
      title: 'Brown', color: Color.fromRGBO(165, 42, 42, 1.0), hex: "0xa52a2a"),

  const ColorsList(
      title: 'Magenta',
      color: Color.fromRGBO(255, 0, 255, 1.0),
      hex: "0xff00ff"),

  const ColorsList(
      title: 'Flash', color: Color.fromRGBO(180, 29, 0, 1.0), hex: "0xff1d00"),
];

Map<String, String> patternsMap = {
  'p1': "Pattern 1",
  'p2': "Pattern 2",
  'p3': "Pattern 3",
  'p4': "Pattern 4",
  'p5': "Pattern 5",
  'p6': "Pattern 6",
  'p7': "Pattern 7",
  'p8': "Pattern 8",
  'p9': "Pattern 9",
  'p10': "Pattern 10",
};

class PatternList {
  const PatternList({this.title, this.code});
  final String code;
  final String title;
}

const List<PatternList> patternList = const <PatternList>[
  const PatternList(title: "Pattern 1", code: 'p1'),
  const PatternList(title: "Pattern 2", code: 'p2'),
  const PatternList(title: "Pattern 3", code: 'p3'),
  const PatternList(title: "Pattern 4", code: 'p4'),
  const PatternList(title: "Pattern 5", code: 'p5'),
  const PatternList(title: "Pattern 6", code: 'p6'),
  const PatternList(title: "Pattern 7", code: 'p7'),
  const PatternList(title: "Pattern 8", code: 'p8'),
  const PatternList(title: "Pattern 9", code: 'p9'),
  const PatternList(title: "Pattern 10", code: 'p10'),
];
