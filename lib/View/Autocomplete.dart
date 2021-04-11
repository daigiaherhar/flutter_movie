import 'dart:math';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'ButtonIcon.dart';

class AutocompleteCustom extends StatefulWidget {
  @override
  _AutocompleteCustomState createState() => new _AutocompleteCustomState();
}

class _AutocompleteCustomState extends State<AutocompleteCustom> {
  List<String> added = [];
  String currentText = "123";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  _AutocompleteCustomState() {
    textField = SimpleAutoCompleteTextField(

      key: key,
      decoration: InputDecoration(
          labelText: "Thể loại",
          labelStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(),
      ),
      suggestions: suggestions,

      textChanged: (text) => currentText = text,
      clearOnSubmit: true,

      textSubmitted: (text) => setState(() {
        if (text != "" && text.length<=25) {
          added.add(text);
        }
        if(text.length >=25){
          AlertDialog(semanticLabel: "nhỏ hơn 25",);
        }
      }),
    );

  }

  List<String> suggestions = [
    "Kiếm hiệp",
    "Thần thoại",
    "Wibu",
    "Anime",
    "Cổ trang",
    "Đoãn chí bình",
  ];

  SimpleAutoCompleteTextField textField;
  bool showWhichErrorText = false;

  @override
  Widget build(BuildContext context) {
    Column body = new Column(children: [
      new ListTile(
          title: textField,
          trailing: new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                textField.triggerSubmitted();
                showWhichErrorText = !showWhichErrorText;
              })),
    ]);

    body.children.addAll(added.map((item) {

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            item.toString(),
            style: TextStyle(fontSize: 12),
          ),
          ButtonIcon(
            onPressed: () {
              setState(() {
                return added.removeWhere((element) {
                  return element == item;
                });
              });
            },
            icon: Icon(Icons.delete),
            text: Text(""),
          )
        ],
      );
    }));

    return body;
  }
}
