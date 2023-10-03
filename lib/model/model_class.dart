import 'dart:convert';

List<PostingData> postingDataFromJson(String str) => List<PostingData>.from(
    json.decode(str).map((x) => PostingData.fromJson(x)));

String postingDataToJson(List<PostingData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//posting data as data
class PostingData {
  int userId;
  int id;
  String title;
  String body;

  PostingData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostingData.fromJson(Map<String, dynamic> json) => PostingData(
        userId: json["userId"], // Corrected key name
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
