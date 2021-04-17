class ModelRatting{
  int _iOne;
  int _iTwo;
  int _iThree;
  int _iFour;
  int _iFive;
  String _sHeSo;

  ModelRatting(this._iOne, this._iTwo, this._iThree, this._iFour, this._iFive,this._sHeSo);

  String get sHeSo => _sHeSo;

  set sHeSo(String value) {
    _sHeSo = value;
  }

  int get iFive => _iFive;

  set iFive(int value) {
    _iFive = value;
  }

  int get iFour => _iFour;

  set iFour(int value) {
    _iFour = value;
  }

  int get iThree => _iThree;

  set iThree(int value) {
    _iThree = value;
  }

  int get iTwo => _iTwo;

  set iTwo(int value) {
    _iTwo = value;
  }

  int get iOne => _iOne;

  set iOne(int value) {
    _iOne = value;
  }
}