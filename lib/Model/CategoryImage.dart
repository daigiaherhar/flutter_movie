class CategoryImage{
  String _sID;
  String _sName;
  String _URL;

  CategoryImage(this._sID, this._sName, this._URL);

  String get URL => _URL;

  set URL(String value) {
    _URL = value;
  }

  String get sName => _sName;

  set sName(String value) {
    _sName = value;
  }

  String get sID => _sID;

  set sID(String value) {
    _sID = value;
  }
}