class Subjects {
  String _sId;
  String _sName;
  int _iCount;
  double _dPrice;

  String get sId => _sId;

  set sId(String value) {
    _sId = value;
  }

  String get sName => _sName;

  double get dPrice => _dPrice;

  Subjects(this._sId, this._sName, this._iCount, this._dPrice);

  set dPrice(double value) {
    _dPrice = value;
  }

  int get iCount => _iCount;

  set iCount(int value) {
    _iCount = value;
  }

  set sName(String value) {
    _sName = value;
  }
}
