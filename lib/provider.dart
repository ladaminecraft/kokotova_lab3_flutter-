import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class FanHTTP {
  final String name;
  final String nickname;
  final String birthday;

FanHTTP({
  required this.name,
  required this.nickname,
  required this.birthday,
  });

 factory FanHTTP.fromJson(List<dynamic> rawData) {
    return FanHTTP(
      name: rawData.first["name"],
      nickname: rawData.first["nickname"],
      birthday: rawData.first["birthday"],
    );
  }
}

class InputProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FanHTTP? _data;
  FanHTTP? get data => _data;

  Future<void> fetchStatusCode(url) async {
    _isLoading = true;
    notifyListeners();
    String myURL='https://www.breakingbadapi.com/api/characters/${url}';
    final response = await http.get(Uri.parse(myURL));
    _data = FanHTTP.fromJson(jsonDecode(response.body));
    _isLoading = false;
    notifyListeners();
  }
}
