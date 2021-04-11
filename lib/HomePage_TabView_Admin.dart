import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'View/CheckBoxCustom.dart';
import 'View/ButtonIcon.dart';
import 'View/EditFlieCategory.dart';
import 'View/TextFieldCustom.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'View/Autocomplete.dart';

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  bool _checkThanThoai = false;
  bool _checkKiemHiep = false;
  String linkYTB;
  bool isVisible = false;
  File _selectIMG;

  Widget getImage() {
    return GestureDetector(
        onTap: chooseImage,
        child: _selectIMG == null
            ? Image.asset(
                "assets/images/choose.jpg",
                height: 200,
                width: 300,
                semanticLabel: 'Das mascot',
              )
            : Image.file(
                _selectIMG,
                height: 200,
                width: 300,
                semanticLabel: 'Das mascot',
              ));
  }

  chooseImage() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _selectIMG = File(pickedFile.path);
      });
    }
  }

  List testAuto = [
    {"tập 1"},
    {"tập 2"},
    {"tập 3"},
    {"tập 4"},
    {"tập 5"},
  ];

  AutoCompleteTextField searchTextField;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchTextField = AutoCompleteTextField<String>(
        style: new TextStyle(color: Colors.black, fontSize: 16.0),
        decoration: new InputDecoration(
            suffixIcon: Container(
              width: 85.0,
              height: 60.0,
            ),
            contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
            filled: true,
            hintText: 'Search Player Name',
            hintStyle: TextStyle(color: Colors.black)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Admin add movide"),

        ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.cyanAccent,
            ])),
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldCustom(
                  1, 26, "Tên phim", "", TextStyle(color: Colors.black26), false,
                      (value) {
                    setState(() {});
                  }),
              TextFieldCustom(1, 26, "Thời lượng / phút", "",
                  TextStyle(color: Colors.black26), false, (value) {
                    setState(() {});
                  }),
              TextFieldCustom(
                  1, 26, "Số tập", "", TextStyle(color: Colors.black26), false,
                      (value) {
                    setState(() {});
                  }),
              TextFieldCustom(
                  1, 26, "Quốc gia", "", TextStyle(color: Colors.black26), false,
                      (value) {
                    setState(() {});
                  }),
              TextFieldCustom(
                  1, 26, "Tác giả", "", TextStyle(color: Colors.black26), false,
                      (value) {
                    setState(() {});
                  }),
              TextFieldCustom(1, 4, "Năm phát hành", "",
                  TextStyle(color: Colors.black26), false, (value) {
                    setState(() {});
                  }),
              TextFieldCustom(
                  8, 26, "Mô tả", null, TextStyle(color: Colors.black26), false,
                      (value) {
                    setState(() {});
                  }),
              Row(
                children: [
                  Expanded(
                    child: TextFieldCustom(1, 500, "Link phim/YTB", null,
                        TextStyle(color: Colors.black26), false, (value) {
                          setState(() {
                            linkYTB = value;
                            if (Uri.parse(linkYTB).isAbsolute) {
                              isVisible = true;
                            } else {
                              isVisible = false;
                            }
                          });
                        }),
                    flex: 5,
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Expanded(
                      child: ButtonIcon(
                        text: Text(""),
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          if (await canLaunch(linkYTB)) {
                            await launch(linkYTB);
                          } else {
                            throw 'Can not open link URL';
                          }
                        },
                      ),
                      flex: 1,
                    ),
                  )
                ],
              ),
              // AutocompleteCustom(),
              EditFileCategory(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     // CheckBoxCustom(Text("Thần thoại"), _checkThanThoai, (value) {
              //     //   setState(() {
              //     //     _checkThanThoai = value;
              //     //   });
              //     // }),
              //     // CheckBoxCustom(Text("Kiếm hiệp"), _checkKiemHiep, (value) {
              //     //   setState(() {
              //     //     _checkKiemHiep = value;
              //     //   });
              //     // }),
              //
              //
              //   ],
              // ),
              getImage(),

              ButtonIcon(
                onPressed: ()=> _submit(),
                icon: Icon(Icons.add),
                text: Text("sss"),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
_submit() {
  DatabaseReference database =
  FirebaseDatabase.instance.reference().child("subjects");
  database.push().set({
    'sID': "_txtUID.text",
    'sName': "_txtName.text",
    'iCount': "_txtPhone.text",
    'iPrice': 'hien tai chua co'
  });
}