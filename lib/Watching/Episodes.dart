import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/Model/Movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'YTB.dart';

class Episodes extends StatefulWidget {
  Movie movie;

  Episodes(this.movie);

  @override
  _EpisodesState createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  List<String> theLoai = [];

  bool onNextClick = true;
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child("Movie");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // sotap.add("value");

    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");
    theLoai.add(
        "https://weblinhtinh.xyz/wp-content/uploads/2019/05/slime-chuyen-sinh-1-250x350.jpg");

    // movie = new Movie("2","_tenPhim", 24, "soTap", theLoai, "_quocGia", "_tacGia",
    //     200, "_moTa", theLoai, "_hinhAnh");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Các tập",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: GridView.builder(
            itemCount: widget.movie.listURLCacTap.length,
            itemBuilder: (context, index) {
              return ListEpisodes(widget.movie, index);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
            ),

            shrinkWrap: true,

            // giải cứu listview
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(2),
            // children: sotap.map((list) => ListEpisodes(list,movie.tenPhim,sotap.length)).toList(),
          ),
        ),
      ],
    );
  }
}

class ListEpisodes extends StatefulWidget {
  Movie movie;

  int iSotap;

  ListEpisodes(this.movie, this.iSotap);

  @override
  _ListEpisodesState createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes> {
  bool onClick = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onClickk(bool click) {
    if (click == true) {}
  }

  @override
  Widget build(BuildContext context) {
    int sotapHientai = widget.iSotap +1;
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                onClick = true;
              });

              PlayYTB.controllerYTB.load(YoutubePlayer.convertUrlToId(
                  widget.movie.listURLCacTap[widget.iSotap].toString()));
              PlayYTB.controllerYTB.pause();

              // PlayYTB.nextVideo = YoutubePlayer.convertUrlToId(
              //     "https://www.youtube.com/watch?v=N9I8EE5YBL0"),
              // print(count);
            },
            child: Stack(
              children: [
                Image.network(
                  widget.movie.hinhAnh,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
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
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        widget.movie.tenPhim,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          'Tập: ' + sotapHientai.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: onClick == true ? Colors.yellow : Colors.black),
        ),
        // widget.onClickNext == true?
      ],
    );
  }
}
