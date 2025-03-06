import 'dart:convert';

class CatModel {
  String id;
  List<String> tags;
  String cretedAt;
  String url;
  String mimetype;

  CatModel({
    required this.id,
    required this.tags,
    required this.cretedAt,
    required this.url,
    required this.mimetype,
  });

  factory CatModel.fromJson(String json) {
    return CatModel.fromMap(jsonDecode(json));
  }

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      id: map['id'],
      tags: [],
      cretedAt: map['created_at'],
      url: map['url'],
      mimetype: map['mimetype'],
    );
  }
}
