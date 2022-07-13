import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text("RGB Trim", style: TextStyle(fontWeight: FontWeight.bold),),
      // title: Image(image: AssetImage("images/logo.png")),
      // actions: [
      //   IconButton(
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/help');
      //       },
      //       icon: Icon(Icons.help_rounded))
      // ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
