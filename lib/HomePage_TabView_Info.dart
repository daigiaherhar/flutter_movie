import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HomePage_TabView_Admin.dart';

class HomeInfo extends StatefulWidget {

  @override
  _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  int count =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightGreenAccent,
              Colors.amberAccent,
              Colors.cyanAccent,
              Colors.cyanAccent,
              Colors.white,
              Colors.black45,
            ],
            stops: [
              0.01,
              0.4,
              0.5,
              0.6,
              0.7,
              0.8,
            ],
          )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if (count == 5)
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddMovie()));
                    count = 0;
                  }
                setState(() {
                  count++;
                });
              },
              child: Image.asset(
                "assets/images/logo-K69decor.png",
                width: 200,
                height: 200,
              ),
            ),
            Text(
              "K69Decor",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              child: Text(
                "Về chúng tôi",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              alignment: Alignment.topLeft,
            ),
            Align(
              child: Text(
                "K69Decor là đơn vị có bề dày kinh nghiệm trong lĩnh vực thiết kế và thi công nội thất. Thành lập từ năm 2017, bàn tay và khối óc của đội ngũ K69Decor đã thiết kế và thi công hàng trăm công trình và dự án ở Hồ Chí Minh và các tỉnh thành lân cận miền Nam.",
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              child: Text(
                "Thông tin liên hệ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              child: Text(
                "Hotline: 0969.3636.60 - 0379.29.33.79",
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              child: Row(
                children: [
                  Text("Website: "),
                  GestureDetector(
                    onTap: () async {
                      await launch("https://k69decor.com/");
                    },
                    child: Text(
                      "https://k69decor.com/",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
            )
          ],
        ),
      ),
    );
  }
}
