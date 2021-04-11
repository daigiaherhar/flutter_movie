import 'package:flutter/material.dart';

class Episodes extends StatelessWidget {
  List sss = [
    {
      "https://i.pinimg.com/originals/65/be/69/65be696d11691d4350d6cc3aa00622c2.jpg",
      "tập 1"
    },
    {
      "https://i.pinimg.com/originals/65/be/69/65be696d11691d4350d6cc3aa00622c2.jpg",
      "tập 2"
    },
    {
      "https://i.pinimg.com/originals/65/be/69/65be696d11691d4350d6cc3aa00622c2.jpg",
      "tập 3"
    },
    {
      "https://i.pinimg.com/originals/65/be/69/65be696d11691d4350d6cc3aa00622c2.jpg",
      "tập 4"
    },
    {
      "https://i.pinimg.com/originals/65/be/69/65be696d11691d4350d6cc3aa00622c2.jpg",
      "tập 5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          "Các tập",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Expanded(
            child: GridView.count(
          crossAxisCount: 2,
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ))
      ],
    ));
  }
}

class ListEpisodes extends StatefulWidget {
  @override
  _ListEpisodesState createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
