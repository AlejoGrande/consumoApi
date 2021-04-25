import 'dart:io';
import 'package:consumo_api/src/model/user_model.dart';
import 'package:http/http.dart' as http;


class UsersProvider {
  Future<List<User>> users() async {
    final url = "https://jsonplaceholder.typicode.com/users";

    final resp = await http.get(url);

    final decodeResp = userFromJson(resp.body);
    return decodeResp;
    

  }

}