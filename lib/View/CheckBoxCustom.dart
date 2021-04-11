import 'package:flutter/material.dart';

class CheckBoxCustom extends StatelessWidget {
  final bool value;

  final Text text;
  final Function onChanged;

  CheckBoxCustom(this.text, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: value,
              onChanged: (value) {
                onChanged(value);
              },
              checkColor: Colors.black,
            ),
          ),
          text,
        ],
      ),
    );
  }
}
