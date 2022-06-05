import 'package:http/http.dart' as http;
import '../models/users_model.dart';
import 'dart:convert';
import 'dart:developer';

Future<Users?> getUsersData() async {
  Users? result;
  String url = "https://reqres.in/api/users?page=2";
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final list = json.decode(response.body);
      result = Users.fromJson(list);
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
