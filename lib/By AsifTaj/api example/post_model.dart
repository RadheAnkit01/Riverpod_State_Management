import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  try {
    final url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<PostModel> postList = data.map((el) {
        return PostModel.fromJson(el);
      }).toList();
      return postList;
    } else {
      throw "Something went wrong while requesting to server!";
    }
  } catch (err) {
    rethrow;
  }
});

class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
