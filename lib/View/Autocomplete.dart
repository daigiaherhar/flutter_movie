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
        hoverColor: Colors.white,
        fillColor: Colors.white,
        focusColor: Colors.white,
        labelText: "Search",
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
      suggestions: suggestions,
      textChanged: (text)=>{
        print(text),
        setState(() {
          currentText = text;
        })
      },
      clearOnSubmit: false,

      textSubmitted: (text)  {
        setState(() {
          currentText = text;
        });
        // print(currentText);
        //
      },

      submitOnSuggestionTap: false,
      // currentText = text,
      // setState(() {
      //   currentText = text;
      //   // if (text != "" && text.length <= 25) {
      //   //   added.add(text);
      //   // }
      //   // if (text.length >= 25) {
      //   //   AlertDialog(semanticLabel: "nhỏ hơn 25",);
      //   // }
      // }),
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
      Container(
        child: new ListTile(
          title: Container(color: Colors.white, child: textField),
          trailing: ButtonIcon(
            icon: Icon(Icons.search),
            text: Text(""),
            onPressed: () {
              // textField.triggerSubmitted();
              print(currentText);
            },
          ),
        ),
      ),
    ]);

    // body.children.addAll(added.map((item) {
    //
    //   return Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       Text(
    //         item.toString(),
    //         style: TextStyle(fontSize: 12),
    //       ),
    //       // ButtonIcon(
    //       //   onPressed: () {
    //       //     setState(() {
    //       //       return added.removeWhere((element) {
    //       //         return element == item;
    //       //       });
    //       //     });
    //       //   },
    //       //   icon: Icon(Icons.delete),
    //       //   text: Text(""),
    //       // )
    //     ],
    //   );
    // }));

    return body;
  }
}
