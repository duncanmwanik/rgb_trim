import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog(
    this.message,
    this.success, {
    Key key,
  }) : super(key: key);

  final String message;
  final bool success;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.topCenter,
      elevation: 0,
      backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: new BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.success
                    ? Icons.sentiment_very_satisfied_rounded
                    : Icons.sentiment_dissatisfied_rounded,
                color: widget.success ? Colors.green : Colors.red,
                size: 20,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Text(
                "${widget.message}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Color(0xff404040),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 15),
            IconButton(
                onPressed: () => Navigator.pop(context),
                splashRadius: 30,
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
