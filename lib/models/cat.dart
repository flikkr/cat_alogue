import 'dart:convert';

import 'package:cat_alogue/models/interface/database_model.dart';
import 'package:cat_alogue/models/media_item.dart';

import '../services/data/local_database.dart';

class Cat extends IDatabaseModel {
  String? name;
  String? description;
  bool isFavourite;
  String? profileImgPath;
  List<MediaItem>? media;

  Cat({
    this.name,
    this.description,
    this.isFavourite = false,
    this.profileImgPath,
    this.media,
  });

  @override
  Future<void> initModel() {
    // TODO: implement initModel
    throw UnimplementedError();
  }

  @override
  Future<int> create(IDatabaseModel model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<IDatabaseModel> query(int id) {
    // TODO: implement getModel
    throw UnimplementedError();
  }

  @override
  Future<void> update(IDatabaseModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'isFavourite': isFavourite,
    };
  }

  @override
  String toString() =>
      'Cat(name: $name, description: $description, isFavourite: $isFavourite)';
}
