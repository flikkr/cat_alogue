import 'dart:convert';

import 'package:cat_alogue/models/interface/database_model.dart';
import 'package:cat_alogue/services/local_database.dart';

class Cat extends IDatabaseModel {
  String name;
  String description;
  bool isFavourite;

  Cat({
    this.name,
    this.description,
    this.isFavourite = false,
  });

  @override
  Future<void> initModel() {
    // TODO: implement initModel
    throw UnimplementedError();
  }

  @override
  Future<int> create(IDatabaseModel model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete({int id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<IDatabaseModel> query({int id}) {
    // TODO: implement getModel
    throw UnimplementedError();
  }

  @override
  Future<void> update(IDatabaseModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Cat copyWith({
    String name,
    String description,
    bool isFavourite,
  }) {
    return Cat(
      name: name ?? this.name,
      description: description ?? this.description,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'isFavourite': isFavourite,
    };
  }

  factory Cat.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cat(
      name: map['name'],
      description: map['description'],
      isFavourite: map['isFavourite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cat.fromJson(String source) => Cat.fromMap(json.decode(source));

  @override
  String toString() =>
      'Cat(name: $name, description: $description, isFavourite: $isFavourite)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cat &&
        o.name == name &&
        o.description == description &&
        o.isFavourite == isFavourite;
  }

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ isFavourite.hashCode;
}
