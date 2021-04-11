class Category {
  String _id;
  String _ten;

  Category(this._id, this._ten);

  String get ten => _ten;

  set ten(String value) {
    _ten = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': _ten
    };
  }
}