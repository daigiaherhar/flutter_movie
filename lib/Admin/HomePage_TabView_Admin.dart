import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../View/CheckBoxCustom.dart';
import '../View/ButtonIcon.dart';
import '../View/EditFlieCategory.dart';
import '../View/TextFieldCustom.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import '../Model/Movie.dart';

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  List<int> ColumCacTap = [];
  int countColumnCacTap;
  List<String> listURLSoTap = [];

  String sURLCacTap;

  String linkYTB;
  bool isVisible = false;
  File _selectIMG;
  Column columSoTap;
  int iSotap;

  List<String> theloaiii = ["12", "33"];

  Movie movie = new Movie("", "", 0, "", null, "", "", 0, "", null, "");
  final _key = GlobalKey<FormState>();

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

  Widget btn() {
    return ButtonIcon(
      onPressed: () => {
        setState(() {
          ColumCacTap.removeAt(0);

        }),
        // print(movie.listURLCacTap.length),
        // columSoTap.children.addAll(listSoTap.map((e) {
        //
        // }))
      },
      text: Text(""),
      icon: Icon(Icons.restore_from_trash),
    );
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

  Widget ss;
  List testAuto = [
    {"tập 1"},
    {"tập 2"},
    {"tập 3"},
    {"tập 4"},
    {"tập 5"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // movie.theLoai.add("value");
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
              TextFieldCustom(null, 1, 26, "Tên phim", "",
                  TextStyle(color: Colors.black26), false, (value) {
                setState(() {
                  movie.tenPhim = value;
                });
              }, null),
              TextFieldCustom(
                  TextInputType.number,
                  1,
                  26,
                  "Thời lượng / phút",
                  "",
                  TextStyle(color: Colors.black26),
                  false, (value) {
                setState(() {
                  movie.thoiLuong = value;
                });
              }, null),
              //sotap
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldCustom(
                            TextInputType.number,
                            1,
                            26,
                            "Tổng số tập",
                            "",
                            TextStyle(color: Colors.black26),
                            false, (value) {
                          setState(() {
                            movie.tongSoTap = value;
                          });
                        }, null),
                      ),
                      ButtonIcon(
                        onPressed: () => {
                          setState(() {
                            ColumCacTap.add(1);
                            // movie.listURLCacTap.add("+1");
                          }),
                          print(ColumCacTap.length),
                          // columSoTap.children.addAll(listSoTap.map((e) {
                          //
                          // }))
                        },
                        text: Text(""),
                        icon: Icon(Icons.add),
                      ),
                      Visibility(
                          visible: ColumCacTap.length == 0 ? false : true,
                          child: btn()),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.yellow,
                      Colors.cyanAccent,
                      Colors.yellow,
                    ])),
                    height: ColumCacTap.length != 0 ? 200 : 0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: ColumCacTap.length,
                      itemBuilder: (context, index) {
                        return EditTextSoTap(index + 1);
                      },
                    ),
                  ),
                ],
              ),
              TextFieldCustom(null, 1, 26, "Quốc gia", "",
                  TextStyle(color: Colors.black26), false, (value) {
                setState(() {
                  movie.quocGia = value;
                });
              }, null),
              TextFieldCustom(null, 1, 26, "Tác giả", "",
                  TextStyle(color: Colors.black26), false, (value) {
                setState(() {
                  movie.tacGia = value;
                });
              }, null),
              TextFieldCustom(TextInputType.number, 1, 4, "Năm phát hành", "",
                  TextStyle(color: Colors.black26), false, (value) {
                setState(() {
                  movie.namPhatHanh = value;
                });
              }, null),
              TextFieldCustom(null, 8, 26, "Mô tả", null,
                  TextStyle(color: Colors.black26), false, (value) {
                setState(() {
                  movie.moTa = value;
                });
              }, null),
              // Row(
              //   children: [
              //     Expanded(
              //       child: TextFieldCustom(null, 1, 500, "Link phim/YTB", null,
              //           TextStyle(color: Colors.black26), false, (value) {
              //         setState(() {
              //           linkYTB = value;
              //           if (Uri.parse(linkYTB).isAbsolute) {
              //             isVisible = true;
              //           } else {
              //             isVisible = false;
              //           }
              //         });
              //       }),
              //       flex: 5,
              //     ),
              //     Visibility(
              //       visible: isVisible,
              //       child: Expanded(
              //         child: ButtonIcon(
              //           text: Text(""),
              //           icon: Icon(Icons.search),
              //           onPressed: () async {
              //             if (await canLaunch(linkYTB)) {
              //               await launch(linkYTB);
              //             } else {
              //               throw 'Can not open link URL';
              //             }
              //           },
              //         ),
              //         flex: 1,
              //       ),
              //     )
              //   ],
              // ),
              EditFileCategory(theloaiii),
              getImage(),
              ButtonIcon(
                onPressed: () => {_submit()},
                icon: Icon(Icons.add),
                text: Text("sss"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget EditTextSoTap(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFieldCustom(TextInputType.number, 1, 26, "Tập $index",
                "", TextStyle(color: Colors.black26), false, (value) async {
              print(sURLCacTap.toString());
              if (await canLaunch(value)) {
                //               await launch(linkYTB);
                sURLCacTap = value;
                listURLSoTap.add(value);
                print("Win Tùng");
              }
              // setState(() {
              // });
            }, (value) {}),
          ),
        ],
      ),
    );
  }

  _submit() {
    DatabaseReference database =
        FirebaseDatabase.instance.reference().child("Movie");
    database.push().set({
      // 'sID': "_txtUID.text",
      // 'sName': "_txtName.text",
      // 'iCount': "_txtPhone.text",
      // 'iPrice': 'hien tai chua co',
      //
      'id': "movie.id",
      'TenPhim': "movie.tenPhim",
      'ThoiLuong': "movie.thoiLuong",
      'TongSotap': "movie.tongSoTap",
      'ListapPhim': theloaiii,
      'QuocGia': "movie.quocGia",
      'TacGia': "movie.tacGia",
      'NamPhatHanh': "movie.namPhatHanh",
      'MoTa': "movie.moTa",
      'TheLoai': theloaiii,
      'Hinh Anh': "movie.hinhAnh",
    });
    // print(movie.tenPhim);
    // print(listURLSoTap[0].toString() + "Tùng");
  }
}
