import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class TextFieldCustom extends StatelessWidget {

  final TextStyle textStyle;
  final int maxLength;
  final int maxLines;

  final bool hideText;
  final String text;
  final Function onPressed;
  final String counterText;

  TextFieldCustom(this.maxLines,this.maxLength,this.text,this.counterText,this.textStyle,this.hideText,this.onPressed);
  //final Decoration Decoration;
  // TextFieldCustom(this.Decoration);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(

          decoration: InputDecoration(
              labelText: text,
              labelStyle: textStyle,

              border: OutlineInputBorder(),
              counterText: ""),
          onChanged: (value){
            onPressed(value);
          },

          obscureText: hideText,
          maxLines: maxLines,
          maxLength: maxLength,
        ),
      ),
    );
  }
}
