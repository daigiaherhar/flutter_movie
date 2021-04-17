// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie/Model/ModelRatting.dart';
import 'package:flutter_movie/Model/Movie.dart';
import 'package:flutter_movie/View/ButtonIcon.dart';
import 'package:rating_bar/rating_bar.dart';


class Ratting extends StatefulWidget {
  @override
  RattingState createState() => RattingState();
}

class RattingState extends State<Ratting> {
  double _ratingStar = 0;
  IconData _selectedIcon;
  bool _isVertical = false;

  double sizeMax = 100.0;
  ModelRatting mdRatting = new ModelRatting(0, 0, 0, 0, 5,"5");

  double size1;
  double size2;
  double size3;
  double size4;
  double size5;
  double dHeSoRate = 5;

  @override
  void setState(fn) {
    // TODO: implement setState
    // dataFirebase.child("Ratting").once().then((DataSnapshot snapdata) {
    //   var data = snapdata.value;
    //   mdRatting = new ModelRatting(data["1"], data["2"], data["3"],
    //       data["4"], data["5"], data["HeSo"]);
    //   // data.forEach((key,value) {
    //   //   mdRatting = new ModelRatting(value["1"], value["2"], value["3"], value["4"], value["5"], value["HeSo"]);
    //   // });
    //   // mdRatting = datasns.value.ModelRatting;
    //   // print(data["HeSo"].toString()+ 'Tùng');
    // });

    super.setState(fn);
  }

  final DatabaseReference dataFirebase = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getDataFirebase
    dataFirebase.child("Ratting").once().then((DataSnapshot snap) {
      var data = snap.value;
      // var key = snap.key;
      // int s = data["1"];
      mdRatting = new ModelRatting(data['1'], data['2'], data['3'], data['4'], data['5'],data['HeSo'].toString());
      // rattings.clear();
      // data.forEach((key,value) {
      //
      //   // mdRatting = new ModelRatting(value["1"], value["2"], value["3"], value["4"], value["5"], value["HeSo"]);
      //   //  rattings.add(aa);
      // });
      dHeSoRate = double.parse(mdRatting.sHeSo.toString());


      _setSizeAviable();
      setState(() {
        // _setSizeAviable();
        // print(mdRatting.iThree.toString() + 'tùng');
      });
    });


    // mdRatting == null
    //     ? mdRatting = ModelRatting(0, 0, 0, 0, 5, 5.0):null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Đánh giá: "),
            RatingBar(
              onRatingChanged: (rating) {
                setState(() => _ratingStar = rating);
              },
              filledIcon: Icons.star,
              filledColor: Colors.yellow,
              emptyColor: Colors.black,
              emptyIcon: Icons.star_border,
            ),
          ],
        ),
        ButtonIcon(
            icon: Icon(Icons.ac_unit),
            text: Text("123"),
            onPressed: () => {_input(mdRatting, _ratingStar.toInt()),_setSizeAviable()}),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  dHeSoRate.toStringAsFixed(1),
                  style: TextStyle(fontSize: 40),
                ),
                RatingBar.readOnly(
                  filledColor: Colors.yellow,
                  size: 20,
                  initialRating: dHeSoRate,
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
              FiveRatting(Text("5"), sizeMax, size5),
              FiveRatting(Text("4"), sizeMax, size4),
              FiveRatting(Text("3"), sizeMax, size3),
              FiveRatting(Text("2"), sizeMax, size2),
              FiveRatting(Text("1"), sizeMax, size1),
              // Text(mdRatting.iFour.toString())
            ])
          ],
        ),
      ],
    );
  }

  _setSizeAviable() {
    int totalVote = mdRatting.iOne +
        mdRatting.iTwo +
        mdRatting.iThree +
        mdRatting.iFour +
        mdRatting.iFive;

    double totalPT = totalVote / 100;


    size1 = (mdRatting.iOne) / totalPT;
    size2 = (mdRatting.iTwo) / totalPT;
    size3 = (mdRatting.iThree) / totalPT;
    size4 = (mdRatting.iFour) /totalPT;
    size5 = (mdRatting.iFive) / totalPT;



    print(size1.toString());
    print(size2.toString());
    print(size3.toString());
    print(size4.toString());
    print(size5.toString());
  }

  _input(ModelRatting ratting, int setRatting) {
    switch (setRatting) {
      case 1:
        {
          // statements;
          ratting.iOne++;
        }
        break;
      case 2:
        {
          // statements;
          ratting.iTwo++;
        }
        break;
      case 3:
        {
          // statements;
          ratting.iThree++;
        }
        break;
      case 4:
        {
          // statements;
          ratting.iFour++;
        }
        break;
      case 5:
        {
          // statements;
          ratting.iFive++;
        }
        break;
    }

    int iOneStar = ratting.iOne * 1;
    int iTowStar = ratting.iTwo * 2;
    int iThreeStar = ratting.iThree * 3;
    int iFourStar = ratting.iFour * 4;
    int iFiveStar = ratting.iFive * 5;
    int totalVote = ratting.iOne +
        ratting.iTwo +
        ratting.iThree +
        ratting.iFour +
        ratting.iFive;
    int total = iOneStar + iTowStar + iThreeStar + iFourStar + iFiveStar;
    dHeSoRate = total / totalVote;
    // dHeSoRate.toStringAsFixed(1);
    setState(() {
      print(dHeSoRate.toStringAsFixed(1).toString() + "tùng 2");
    });
    String heso = dHeSoRate.toStringAsFixed(1);
    dataFirebase.child("Ratting").set({
      '1': ratting.iOne,
      '2': ratting.iTwo,
      '3': ratting.iThree,
      '4': ratting.iFour,
      '5': ratting.iFive,
      'HeSo': heso,
    });
    // dataFirebase.child("test").set("ccall1");
  }
}

class FiveRatting extends StatelessWidget {
  final Text text;
  final double sizeMax;
  double sizeAvaiable;

  FiveRatting(this.text, this.sizeMax, this.sizeAvaiable);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        text,
        SizedBox(
          width: 5,
        ),
        Stack(
          children: [
            Container(
              width: sizeMax,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white70,
              ),
            ),
            Container(
                width: sizeAvaiable,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.black,
                )),
          ],
        ),
      ],
    );
  }
}

// ignore: missing_return
// _getData(ModelRatting mdRatting) async {
//   ModelRatting newRatting = new ModelRatting(0, 0, 0, 0, 5, 5);
//   dataFirebase.child("Ratting").once().then((DataSnapshot snapdata) {
//     var data = snapdata.value;
//     newRatting = new ModelRatting(data["1"], data["2"], data["3"],
//         data["4"], data["5"], data["HeSo"]);
//     // data.forEach((key,value) {
//     //   mdRatting = new ModelRatting(value["1"], value["2"], value["3"], value["4"], value["5"], value["HeSo"]);
//     // });
//     // mdRatting = datasns.value.ModelRatting;
//
//   });
//   mdRatting = newRatting;
// }
