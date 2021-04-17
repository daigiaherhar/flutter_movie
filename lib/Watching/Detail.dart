import 'package:flutter/material.dart';
import 'package:flutter_movie/Model/Movie.dart';


class DetailWatchingYTB extends StatelessWidget {
  final Movie movie;
  DetailWatchingYTB(this.movie);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            movie.hinhAnh,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
          Text(
            movie.tenPhim,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Purport("Thời lượng", String.fromCharCode(movie.thoiLuong)),
          Purport("Số tập", movie.tongSoTap),
          Purport("Quốc gia", movie.quocGia),
          Purport("Tác giả", movie.tacGia),
          Purport("Phát hành", String.fromCharCode(movie.namPhatHanh)),
          Text(
            "Tóm tắt",
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Text(
              movie.moTa
          )
       ]
      ),
    );
  }
}

class Purport extends StatelessWidget {
  final String sDefault;
  final String sPuport;

  Purport(this.sDefault, this.sPuport);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            sDefault,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text(
            sPuport,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
