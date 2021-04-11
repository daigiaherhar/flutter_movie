import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'TextFieldCustom.dart';

import 'ButtonIcon.dart';

class EditFileCategory extends StatefulWidget {
  @override
  _EditFileCategoryState createState() => _EditFileCategoryState();
}

class _EditFileCategoryState extends State<EditFileCategory> {
  List<String> suggestions = [
    "Kiếm hiệp",
    "Thần thoại",
    "Wibu",
    "Anime",
    "Cổ trang",
    "Đoãn chí bình",
  ];
  List<String> addMenu = [];
  String sChooseDropdown;

  @override
  Widget build(BuildContext context) {
    Column column = new Column(
      children: [
        new Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.only(left: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 1),
            ),
            child: DropdownButton(
              items: suggestions.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              value: sChooseDropdown,
              onChanged: (newText) {
                sChooseDropdown = newText;
                setState(() {
                  addMenu.add(newText);

                });
              },
              underline: SizedBox(),
              hint: Text(
                "Thể loại",
                style: TextStyle(color: Colors.black26),
              ),
              isExpanded: true,
            ),
          ),
        )
      ],
    );

    column.children.addAll(addMenu.map((item) {
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
                return addMenu.removeWhere((element) {
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
    return column;
  }
}
