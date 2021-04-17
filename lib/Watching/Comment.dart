import 'dart:math';

import 'package:flutter/material.dart';
import '../View/ButtonIcon.dart';
import 'package:random_color/random_color.dart';


class CustomComment extends StatelessWidget {
  String sNameUser = "";

  Random random = new Random();
  Color currentColor;

  @override
  Widget build(BuildContext context) {
    // RandomColor _randomColor = RandomColor();
    // Color _color1 = _randomColor.randomColor(
    //   colorBrightness: ColorBrightness.light,
    // );
    // Color _color2 = _randomColor.randomColor(
    //   colorBrightness: ColorBrightness.dark,
    // );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Expanded(
                        child: TextField(

                      decoration: InputDecoration(
                          labelText: "Tên bạn",
                          labelStyle: TextStyle(color: Colors.black),
                          hoverColor: Colors.white,
                          // fillColor: currentColor,
                          border: OutlineInputBorder(),
                          counterText: ""),
                      onChanged: (value) {
                        // sNameUser = value;
                      },
                      maxLines: 1,
                      maxLength: 20,
                    )),
                  ),

                  sNameUser.length == 0
                      ? CircleAvatar(

                    radius: 30,
                    child: Icon(Icons.account_circle_rounded),
                  )
                      : CircleAvatar(

                    radius: 30,
                    child: Text(
                      sNameUser.substring(0, 1),
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],

              ),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Expanded(
                        child: TextField(

                          decoration: InputDecoration(
                              labelText: "Tên bạn",
                              labelStyle: TextStyle(color: Colors.black),
                              hoverColor: Colors.white,
                              // fillColor: currentColor,
                              border: OutlineInputBorder(),
                              counterText: ""),
                          onChanged: (value) {
                            sNameUser = value;
                          },
                          maxLines: 1,
                          maxLength: 20,
                        )),
                  ),


                ],

              ),
            ),

          ],
        ),
      ],
    );
  }
}
