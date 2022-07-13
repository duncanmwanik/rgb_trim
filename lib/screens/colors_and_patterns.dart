import 'package:flutter/material.dart';
import 'package:rgb_trim/global.dart';
import 'package:rgb_trim/objects/objects.dart';
import 'package:rgb_trim/widgets/cards/card_color.dart';
import 'package:rgb_trim/widgets/cards/card_pattern.dart';
import 'package:rgb_trim/custom_color_circle_picker/custom_circle_color_picker.dart';

class ColorsPatterns extends StatefulWidget {
  ColorsPatterns({
    Key key,
  }) : super(key: key);

  @override
  _ColorsPatternsState createState() => _ColorsPatternsState();
}

class _ColorsPatternsState extends State<ColorsPatterns> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Divider(
          color: Colors.white,
          indent: 10,
          endIndent: 10,
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "COLORS",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        //------------------------ COLOR CIRCLE
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: CircleColorPicker(
            controller: colorController,
            onChanged: (color) {
              setState(() {
                selection = "0x${color.value.toRadixString(16).substring(2)}";
              });
            },
            onEnded: (color) {
              setState(() {
                selection = "0x${color.value.toRadixString(16).substring(2)}";
              });
              if (device != null)
                sendTransparentData(
                    "0x${color.value.toRadixString(16).substring(2)}\n");
            },
            size: const Size(230, 230),
            strokeWidth: 4,
            thumbSize: 50,
          ),
        ),

        //------------------------ MAIN COLORS
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)
              ]),
          child: GridView.count(
              crossAxisCount: 5,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: List.generate(colorsList.length, (index) {
                return Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = colorsList[index].hex;
                        });
                        if (device != null) sendTransparentData("$selection\n");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selection == colorsList[index].hex
                              ? Colors.amber
                              : Colors.transparent,
                        ),
                        child: ColorssCard(colorss: colorsList[index]),
                      )),
                );
              })),
        ),

        Divider(
          color: Colors.white,
          indent: 10,
          endIndent: 10,
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "PATTERNS",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        //------------------------ PATTERNS
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0), color: Colors.black38, blurRadius: 4)
              ]),
          child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: List.generate(patternList.length, (index) {
                return Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = patternList[index].code;
                        });
                        if (device != null) sendTransparentData("$selection\n");
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selection == patternList[index].code
                              ? Colors.amber
                              : Colors.transparent,
                        ),
                        child: PatternCard(pattern: patternList[index]),
                      )),
                );
              })),
        ),

        SizedBox(
          height: h * 0.025,
        ),
      ],
    );
  }
}
