import 'package:flutter/material.dart';
import 'package:flutter_movie/View/ButtonIcon.dart';

class TextCacTap extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Row(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "123",
                // labelStyle: textStyle,
                border: OutlineInputBorder(),
                counterText: ""),
            onChanged: (value) {
              // onPressed(value);
            },
            // keyboardType: textInput,
            // obscureText: hideText,
            maxLines: 1,
            maxLength: 200,
          ),
          ButtonIcon(
            onPressed: () {
              if (_key.currentState.validate()) {
                print("123");
              }
            },
            text: Text("123"),
            icon: Icon(Icons.ac_unit),
          )
        ],
      ),
    );
  }
}
