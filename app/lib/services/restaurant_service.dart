import 'dart:convert';

import 'package:app/utils/api_util.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  static Future<List<dynamic>> fetchAll() async {
    try {
      var res = await http.get(
          Uri.parse(
            "${ApiUtil.domain}/restaurants",
          ),
          headers: {'Content-Type': 'application/json'});

      if (res.statusCode == 200) {
        print(res.body);
        return jsonDecode(res.body)['data'] as List<dynamic>;
      } else {
        print('Something went wrong');
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<void> save({
    required String name,
    String description = '',
    required String type,
    required String address,
    String phone = '',
    required int stars,
  }) async {
    try {
      var res = await http.post(
          Uri.parse(
            "${ApiUtil.domain}/restaurants",
          ),
          body: jsonEncode({
            "name": name,
            "description": description,
            "address": address,
            "phone": phone,
            "stars": stars,
            "type": type
          }),
          headers: {
            'Content-Type': 'application/json',
          });

      if (res.statusCode == 200) {
        print(res.body);
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> softDeleteById(int id) async {
    try {
      var res = await http.delete(Uri.parse(
        "${ApiUtil.domain}/restaurants/$id",
      ));

      if (res.statusCode == 200) {
        print(res.body);
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteById(int id) async {
    try {
      var res = await http.delete(Uri.parse(
        "${ApiUtil.domain}/restaurants/$id",
      ));

      if (res.statusCode == 200) {
        print(res.body);
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> update({required dynamic item, required int id}) async {
    try {
      var res = await http.put(
        Uri.parse(
          "${ApiUtil.domain}/restaurants/$id",
        ),
        body: jsonEncode({
          'name': item['name'],
          'description': item['description'],
          'address': item['address'],
          'type': item['type'],
          'phone': item['phone'],
          'stars': item['stars']
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (res.statusCode == 200) {
        print(res.body);
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }
}
