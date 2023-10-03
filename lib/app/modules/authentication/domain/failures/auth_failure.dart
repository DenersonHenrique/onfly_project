class AuthFailure {
  final String message;
  AuthFailure._({this.message = ''});

  factory AuthFailure.server({String message = ''}) =>
      AuthFailure._(message: message);

  factory AuthFailure.unexpected() => AuthFailure._();
}
