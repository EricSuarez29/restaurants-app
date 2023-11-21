import 'dart:convert';

import 'package:app/utils/api_util.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  static Future<List<dynamic>> fetchAll() async {
    try {
      var res = await http.get(
          Uri.parse(
            "${ApiUtil.domain}/systems",
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
    required String owner,
    required String release,
    required String version,
    required double price,
  }) async {
    try {
      var res = await http.post(
          Uri.parse(
            "${ApiUtil.domain}/systems",
          ),
          body: jsonEncode({
            "name": name,
            "description": description,
            "release_date": release,
            "latest_version": version,
            "price": price,
            "owner": owner
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

  static Future<void> update({required dynamic item, required int id}) async {
    try {
      var res = await http.put(
        Uri.parse(
          "${ApiUtil.domain}/systems/$id",
        ),
        body: jsonEncode({
          'name': item['name'],
          'description': item['description'],
          'release_date': item['release'],
          'latest_version': item['version'],
          'price': item['price'],
          'owner': item['owner']
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

  static Future<void> softDeleteById(int id) async {
    try {
      var res = await http.delete(Uri.parse(
        "${ApiUtil.domain}/systems/$id",
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
        "${ApiUtil.domain}/systems/$id",
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
}
