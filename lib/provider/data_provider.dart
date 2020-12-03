import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  List<String> _firstname = [];
  List<String> _lastname = [];
  List<String> _imgUrl = [];

  List<String> get firstName {
    return _firstname;
  }

  List<String> get lastName {
    return _lastname;
  }

  List<String> get imgUrl {
    return _imgUrl;
  }

  Future<void> details() async {
    const String url = 'https://reqres.in/api/users?page=2';
    final response = await http.get(url);
    final extractedData = jsonDecode(response.body);
    final List data = extractedData['data'];
    List<String> temp1 = [];
    List<String> temp2 = [];
    List<String> temp3 = [];
    data.forEach((element) {
      temp1.add(element['first_name']);
      temp2.add(element['last_name']);
      temp3.add(element['avatar']);
    });
    _firstname = temp1;
    _lastname = temp2;
    _imgUrl = temp3;
    notifyListeners();
  }
}
