import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/Model/Movie.dart';
import 'package:flutter_movie/Watching/YTB.dart';

import '../../Model/Subjects.dart';
import '../../View/Autocomplete.dart';
import '../../View/ButtonIcon.dart';
import '../../Slider_Image.dart';

import '../../Model/CategoryImage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../Watching/WatchingMovie.dart';
import 'ListMovie_ShowList.dart';

// ignore: camel_case_types
class HomePage_TabView_1 extends StatefulWidget {
  @override
  _HomePage_TabView_1State createState() => _HomePage_TabView_1State();
}

// ignore: camel_case_types
class _HomePage_TabView_1State extends State<HomePage_TabView_1> {
  List<Subjects> listSubject = [];

  int _current = 0;
  List<CategoryImage> listImage = [];

  ScrollController controllerList = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Movie> listMovie = [];
  final DatabaseReference dataFirebase =
      FirebaseDatabase.instance.reference().child("Movie");

  // final DatabaseReference dataFirebaseSotap =
  //     FirebaseDatabase.instance.reference().child("Movie");
  // DatabaseReference dataFirebaseTheLoai =
  //     FirebaseDatabase.instance.reference().child("Movie");
  List urlCacTap = [];
  List listTheLoai = [];
  List<Movie> movieAnime = [];
  List<Movie> movieKiemHiep = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataFirebase.once().then((DataSnapshot snap) {
      var data = snap.value;
      var key = snap.value.keys;
      listMovie.clear();

      data.forEach((key, value) {
        // dataFirebaseSotap
        //     .child(key)
        //     .child("ListapPhim")
        //     .once()
        //     .then((valueSoTap) {
        //   var dataTapphim = valueSoTap.value;
        //   for (int i = 0; i < dataTapphim.length; i++) {
        //     urlCacTap.add(dataTapphim[i].toString());
        //   }
        // });

        // dataFirebaseTheLoai
        //     .child(key)
        //     .child("TheLoai")
        //     .once()
        //     .then((valueTheLoai) {
        //   List<dynamic> dataTheLoai = valueTheLoai.value;
        //
        //   // print(dataTheLoai.toString() + 'tùng');
        //   dataTheLoai.forEach((valueType) {
        //     listTheLoai.add(valueType);
        //   });
        //   // print(listTheLoai.length.toString() +'tùng' + listTheLoai[0].toString() + listTheLoai[1].toString());
        //   // for (int i = 0; i < dataTheLoai.; i++) {
        //   //     listTheLoai.add(dataTheLoai[i].toString());
        //   // }
        //
        // });
        // List<dynamic> listCacTapPhim = value['ListapPhim'];
        // // print(listCacTapPhim.toString());
        // listCacTapPhim.forEach((valueTapPhim) {
        //   // print(valueTapPhim);
        //   urlCacTap.add(valueTapPhim);
        // });
        // print(value['ListapPhim'].toString());
        // List<dynamic> listCacTheLoai = [];
        // listCacTheLoai = value['TheLoai'];
        // listTheLoai.clear();
        // listCacTheLoai.forEach((valueTheLoai) {
        //   listTheLoai.add(valueTheLoai);
        // });
        // // print(value['ListapPhim'].toString());
        // // cc = value['ListapPhim'];
        Movie movie = new Movie(
            key,
            value['TenPhim'],
            int.parse(value['ThoiLuong']),
            value['TongSotap'],
            value['ListapPhim'],
            value['QuocGia'],
            value['TacGia'],
            int.parse(value['NamPhatHanh']),
            value['MoTa'],
            value['TheLoai'],
            value['Hinh Anh']);
        // print(value['TheLoai'].toString());

        listMovie.add(movie);
        //Anime
        movieAnime.clear();
        movieKiemHiep.clear();
        listMovie.forEach((value) {
          value.theLoai.forEach((valueTheLoai) {
            // print(valueAnime.toString());
            if (valueTheLoai == "Anime") {
              movieAnime.add(value);
            }
            if(valueTheLoai == "Kiem hiep"){
              movieKiemHiep.add(value);
            }
          });
        });

      });

      setState(() {
        // print(listMovie.length.toString());
        // List<dynamic>ccrac = listMovie[0].theLoai;
        // print(ccrac.toString());
        print(movieAnime.length);
      });
    });

    CategoryImage image1 = new CategoryImage("11", "One Piece",
        "https://i.pinimg.com/originals/65/be/69/65be696d11691d4350d6cc3aa00622c2.jpg");
    CategoryImage image2 = new CategoryImage(
      "12",
      "Slime bá đạo",
      "https://i.ytimg.com/vi/hDWk9ocK2B8/maxresdefault.jpg",
    );
    CategoryImage image3 = new CategoryImage(
      "13",
      "Boruto",
      "https://i.pinimg.com/originals/39/74/c5/3974c51c3d6a95aead3a07c394f0d739.jpg",
    );
    CategoryImage image4 = new CategoryImage(
      "14",
      "K nhớ",
      "https://macramela.com/wp-content/uploads/2020/07/photo-1-15692139638541765739543.jpg",
    );
    CategoryImage image5 = new CategoryImage("15", "Dáng hình âm thanh",
        "https://genk.mediacdn.vn/2017/photo-0-1494819646402.jpg");
    listImage.add(image1);
    listImage.add(image2);
    listImage.add(image3);
    listImage.add(image4);
    listImage.add(image5);

    Subjects subject1 = new Subjects("1", "C#", 18, 30);
    Subjects subject2 = new Subjects("2", "Java", 20, 300);
    Subjects subject3 = new Subjects("3", "Flutter", 02, 3000);
    Subjects subject4 = new Subjects("3", "Flutter", 02, 3000);
    Subjects subject5 = new Subjects("3", "Flutter", 02, 3000);
    Subjects subject6 = new Subjects("3", "Flutter", 02, 3000);

    listSubject.add(subject1);
    listSubject.add(subject2);
    listSubject.add(subject3);
    listSubject.add(subject4);
    listSubject.add(subject5);
    listSubject.add(subject6);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final double categoryHead = size.height * 0.30;
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   // Colors.black45,
        //   // Colors.white,
        //   // Colors.cyanAccent,
        //   // Colors.amberAccent,
        //   // Colors.lightGreenAccent,
        // ])),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AutocompleteCustom(),
              SizedBox(
                height: 10,
              ),
              Slider_Image(listImage),
              SizedBox(
                height: 10,
              ),
              Text(
                "Anime",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              RawMaterialButton(
                splashColor: Colors.black,
                onPressed: () {},
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  // giải cứu listview
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(2),
                  // controller: controllerList,
                  children: movieAnime.map((e) => CategoryVideo(e)).toList(),
                  // listMovie.map((list) => CategoryVideo(list)).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Kiếm hiệp",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              RawMaterialButton(
                splashColor: Colors.black,
                onPressed: () {},
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  // giải cứu listview
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(2),
                  // controller: controllerList,
                  children: movieKiemHiep.map((e) => CategoryVideo(e)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryVideo extends StatelessWidget {
  final Movie movie;

  CategoryVideo(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlayYTB(movie)));
        // print(movie.listURLCacTap[0].toString());
        // final snackBar =
        //     SnackBar(content: Text(widget.name));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Stack(
        children: <Widget>[
          Image.network(
            movie.hinhAnh,
            height: 500,
            width: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              return progress == null ? child : Text("Đang loading");
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                movie.tenPhim,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
