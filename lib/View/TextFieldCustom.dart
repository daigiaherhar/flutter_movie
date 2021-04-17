import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldCustom extends StatelessWidget {
  final TextStyle textStyle;
  final int maxLength;
  final int maxLines;
  final TextInputType textInput;
  final bool hideText;
  final String text;
  final Function onPressed;
  final Function validator;
  final String counterText;

  TextFieldCustom(this.textInput, this.maxLines, this.maxLength, this.text,
      this.counterText, this.textStyle, this.hideText, this.onPressed,this.validator);

  //final Decoration Decoration;
  // TextFieldCustom(this.Decoration);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(

          validator: validator,
          decoration: InputDecoration(
              labelText: text,
              labelStyle: textStyle,
              border: OutlineInputBorder(),
              counterText: ""),
          onChanged: (value) {
            onPressed(value);
          },
          keyboardType: textInput,
          obscureText: hideText,
          maxLines: maxLines,
          maxLength: maxLength,
        ),
      ),
    );
  }
}
