class Movie{
  String _id;
  String _tenPhim;
  int _thoiLuong;
  String _tongSoTap;
  List<dynamic> _listURLCacTap;
  String _quocGia;
  String _tacGia;
  int _namPhatHanh;
  String _moTa;
  List<dynamic> _theLoai;
  String _hinhAnh;

  Movie(
      this._id,
      this._tenPhim,
      this._thoiLuong,
      this._tongSoTap,
      this._listURLCacTap,
      this._quocGia,
      this._tacGia,
      this._namPhatHanh,
      this._moTa,
      this._theLoai,
      this._hinhAnh);

  String get hinhAnh => _hinhAnh;

  set hinhAnh(String value) {
    _hinhAnh = value;
  }

  List<dynamic> get theLoai => _theLoai;

  set theLoai(List<dynamic> value) {
    _theLoai = value;
  }

  String get moTa => _moTa;

  set moTa(String value) {
    _moTa = value;
  }

  int get namPhatHanh => _namPhatHanh;

  set namPhatHanh(int value) {
    _namPhatHanh = value;
  }

  String get tacGia => _tacGia;

  set tacGia(String value) {
    _tacGia = value;
  }

  String get quocGia => _quocGia;

  set quocGia(String value) {
    _quocGia = value;
  }

  List<dynamic> get listURLCacTap => _listURLCacTap;

  set listURLCacTap(List<dynamic> value) {
    _listURLCacTap = value;
  }

  String get tongSoTap => _tongSoTap;

  set tongSoTap(String value) {
    _tongSoTap = value;
  }

  int get thoiLuong => _thoiLuong;

  set thoiLuong(int value) {
    _thoiLuong = value;
  }

  String get tenPhim => _tenPhim;

  set tenPhim(String value) {
    _tenPhim = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}