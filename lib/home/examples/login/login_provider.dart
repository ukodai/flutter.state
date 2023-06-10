import "package:flutter/material.dart";
import "package:http/http.dart";

class LoginProvider with ChangeNotifier {
  bool _loading = false;

  bool get getLoading => _loading;

  Future<bool> getLogged(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/login/"),
        body: {
          "email": email,
          "password": password,
        },
      );

      response.statusCode == 200 ? true : false;
      notifyListeners();
    } catch (error) {
      _loading = false;
      notifyListeners();
      return false;
    }
    _loading = false;
    notifyListeners();
    return false;
  }
}
