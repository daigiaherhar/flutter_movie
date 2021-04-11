import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final Text text;
  final Icon icon;

  final Function onPressed;

  ButtonIcon({this.icon, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 1.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            text,
          ],
        ),
      ),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      fillColor: Colors.blue,
      splashColor: Colors.red,

      // hiệu ứng button

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      onPressed: onPressed,
    );
  }
}
