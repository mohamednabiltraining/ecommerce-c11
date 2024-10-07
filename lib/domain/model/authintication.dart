import 'package:ecommerce_app/data/model/responses/auth_response/auth_response/user.dart';

class Authintication {
  String? message;
  User? user;
  String? token;

  Authintication({this.message, this.user, this.token});
}
