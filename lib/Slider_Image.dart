import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'Model/CategoryImage.dart';

import 'Watching/WatchingMovie.dart';
import 'Watching/YTB.dart';
class Slider_Image extends StatelessWidget {
  final List<CategoryImage> image;
  AnimationController controller;

  Slider_Image(this.image);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = image
        .map((item) => RawMaterialButton(
            fillColor: Colors.red,
            splashColor: Colors.green,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Watching()));
            },
            child: Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item.URL,
                          fit: BoxFit.cover,
                          width: 1000.0,
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
                              item.sName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )))
        .toList();
    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(

        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 0,
        autoPlay: true,
      ),
    );
  }
}
