class User {
  static final User _User = User._internal();

  factory User() {
    return _User;
  }

  User._internal();

  int id = -5;
  String name = '';
  String email = '';

  ret() {
    var id = User().id;
    var name = User().name;
    var email = User().email;
  }
}
