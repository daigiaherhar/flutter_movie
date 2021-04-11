// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:rating_bar/rating_bar.dart';

class Ratting extends StatefulWidget {
  @override
  RattingState createState() => RattingState();
}

class RattingState extends State<Ratting> {
  double _ratingStar = 0;
  IconData _selectedIcon;
  bool _isVertical = false;

  double sizeMax = 150.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Đánh giá: "),
                RatingBar(
                  onRatingChanged: (rating) => setState(() => _ratingStar = rating),
                  filledIcon: Icons.star,
                  filledColor: Colors.yellow,
                  emptyColor: Colors.black,
                  emptyIcon: Icons.star_border,
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "4,4",
                      style: TextStyle(fontSize: 40),
                    ),
                    RatingBar.readOnly(
                      filledColor: Colors.yellow,
                      size: 20,
                      initialRating: 3.5,
                      isHalfAllowed: true,
                      halfFilledIcon: Icons.star_half,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      emptyColor: Colors.black,
                    ),
                  ],
                ),
                  SizedBox(
                    width: 10,
                  ),
                Column(children: [
                  FiveRatting(Text("5"),sizeMax),
                  FiveRatting(Text("4"),sizeMax),
                  FiveRatting(Text("3"),sizeMax),
                  FiveRatting(Text("2"),sizeMax),
                  FiveRatting(Text("1"),sizeMax),

                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class FiveRatting extends StatelessWidget {
  final Text text;
  final double sizeMax;
  FiveRatting(this.text,this.sizeMax);
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        text,
        SizedBox(
          width: 10,
        ),
        Stack(
          children: [
            Container(
              width: sizeMax,
              height: 5,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(50)),
                color: Colors.white70,
              ),
            ),
            Container(
                width: sizeMax/2,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(50)),
                  color: Colors.black,
                )),
          ],
        ),
      ],
    );
  }
}
