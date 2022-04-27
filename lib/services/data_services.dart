import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataServices {
  Future<List<dynamic>> getUsers() async {
    var info = await rootBundle.loadString('json/data.json');
    List<dynamic> list = jsonDecode(info);
    return Future.delayed(
      Duration(seconds: 2),
      () => list.map((e) => e).toList(),
    );
  }
}
