import 'package:flutter/material.dart';
import '../models/users_model.dart';
import '../services/users_services.dart';

class Data extends ChangeNotifier {
  Users? post;
  bool loading = false;

  getPost() async {
    loading = true;
    post = await getUsersData();
    loading = false;

    notifyListeners();
  }
}
