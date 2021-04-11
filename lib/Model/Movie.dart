class Movie{
  String _tenPhim;
  int _thoiLuong;
  int _soTap;
  String _quocGia;
  String _tacGia;
  int _namPhatHanh;
  String _moTa;
  String _linkPhimYTB;
  List<String> _theLoai;
  String _hinhAnh;

  Movie(
      this._tenPhim,
      this._thoiLuong,
      this._soTap,
      this._quocGia,
      this._tacGia,
      this._namPhatHanh,
      this._moTa,
      this._linkPhimYTB,
      this._theLoai,
      this._hinhAnh);

  String get hinhAnh => _hinhAnh;

  set hinhAnh(String value) {
    _hinhAnh = value;
  }

  List<String> get theLoai => _theLoai;

  set theLoai(List<String> value) {
    _theLoai = value;
  }

  String get linkPhimYTB => _linkPhimYTB;

  set linkPhimYTB(String value) {
    _linkPhimYTB = value;
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

  int get soTap => _soTap;

  set soTap(int value) {
    _soTap = value;
  }

  int get thoiLuong => _thoiLuong;

  set thoiLuong(int value) {
    _thoiLuong = value;
  }

  String get tenPhim => _tenPhim;

  set tenPhim(String value) {
    _tenPhim = value;
  }
}