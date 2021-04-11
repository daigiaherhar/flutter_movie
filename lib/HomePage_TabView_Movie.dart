import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/Subjects.dart';
import 'View/ButtonIcon.dart';
import 'Slider_Image.dart';
import 'TabView_Subjects/CategorySubjects.dart';
import 'Model/CategoryImage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Watching/WatchingMovie.dart';
class HomePage_TabView_1 extends StatefulWidget {
  @override
  _HomePage_TabView_1State createState() => _HomePage_TabView_1State();
}

class _HomePage_TabView_1State extends State<HomePage_TabView_1> {
  List<Subjects> listSubject = [];

  int _current = 0;
  List<CategoryImage> listImage = [];

  ScrollController controllerList = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    controllerList.addListener(() {
      setState(() {
        closeTopContainer = controllerList.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHead = size.height * 0.30;
    return
      Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Colors.black45,
        //   Colors.white,
        //   Colors.cyanAccent,
        //   Colors.amberAccent,
        //   Colors.lightGreenAccent,
        // ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              Slider_Image(listImage),
              SizedBox(
                height: 10,
              ),
              Text("Hành động",textAlign: TextAlign.end,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

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
                  controller: controllerList,
                  children: listSubject.map((list) => CategoryVideo(list.sName)).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Kiếm hiệp",textAlign: TextAlign.end,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                  controller: controllerList,
                  children: listSubject.map((e) => CategoryVideo(e.sName)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryVideo extends StatefulWidget {
  final String name;
  CategoryVideo(this.name);
  @override
  _CategoryVideoState createState() => _CategoryVideoState();
}

class _CategoryVideoState extends State<CategoryVideo> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        // final snackBar =
        //     SnackBar(content: Text(widget.name));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child:  Stack(
        children: <Widget>[
          Image.network(
            "https://i.ytimg.com/vi/hDWk9ocK2B8/maxresdefault.jpg",
            fit: BoxFit.cover,
            width: 500.0,
            height: 500.0,
            loadingBuilder: (context, child, progress) {
              return progress == null
                  ? child
                  : Text("Đang loading");
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
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
              child: Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
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
