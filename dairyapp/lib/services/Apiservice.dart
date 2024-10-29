import 'dart:convert';
import 'package:dairyapp/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseApi = 'http://192.168.252.53:3000';

  static Future<void> addNote(Model model) async {
    print('Called addNote from ApiService class');
    try {
      Uri uri = Uri.parse(baseApi + "/note/add");

      // Set headers and encode the body as JSON
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(model.toMap()), // Encode model data as JSON
      );

      if (response.statusCode == 200) {
        print("Note added successfully: ${response.body}");
      } else {
        print("Failed to add note. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  static Future<void> delete(Model model) async {
    try {
      Uri uri = Uri.parse(baseApi + "/note/delete");

      // Set headers and encode the body as JSON
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(model.toMap()), // Encode model data as JSON
      );

      if (response.statusCode == 200) {
        print("Note added successfully: ${response.body}");
      } else {
        print("Failed to add note. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  static Future<List<Model>> fectdata(String userid) async {
    List<Model> list = [];
    try {
      Uri uri = Uri.parse(baseApi + "/note/list");

      // Set headers and encode the body as JSON
      final response = await http.post(
        uri, body: jsonEncode({'userid': userid}),
        headers: {'Content-Type': 'application/json'},
        // Encode model data as JSON
      );

      if (response.statusCode == 200) {
        print("respoce is : ${response.body}");
        var decodeddata = jsonDecode(response.body);
        for (var data in decodeddata) {
          Model model = Model.fromMAp(data);
          list.add(model);
        }
      } else {
        print("Failed to add note. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
    return list;
  }
}
