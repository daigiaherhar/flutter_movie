import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/painting.dart';



import 'View/ButtonIcon.dart';
import 'HomePage/ListMovie/HomePage_TabView_Movie.dart';
import 'Admin/HomePage_TabView_Admin.dart';
import 'HomePage/HomePage_TabView_Info.dart';
void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('EtQa xem phim tẹt ga',style: TextStyle(color: Colors.black),),
              // actions: [
              //   IconButton(
              //     icon: Icon(Icons.send),
              //     onPressed: () {
              //
              //     },
              //   )
              // ],

            ),
            bottomNavigationBar: Container(
              color: Colors.black,
              child: TabBar(

                labelColor: Colors.amber,
                unselectedLabelColor: Colors.white,
                // tô đen khi chọn tabview đó
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomRight: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.deepOrange),
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.movie_creation),
                  ),
                  Tab(
                    icon: Icon(Icons.engineering),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                HomePage_TabView_1(),
                HomeInfo(),
              ],
            ),
          )),
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




