import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:post_api_app/model/model_class.dart';
import 'dart:convert' as convert;

Future<PostingData> Createdata(
    String title, String body, String idText, String userIdText) async {
  int id = int.parse(idText);
  int userId = int.parse(userIdText);
  final response =
      await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: convert.jsonEncode(<String, dynamic>{
            'title': title,
            'body': body,
            'id': id,
            'userId': userId,
          }));
  print(response.body);
  if (response.statusCode == 201) {
    return PostingData.fromJson(convert.json.decode(response.body));
  } else {
    throw Exception('Failed to load the data');
  }
}
