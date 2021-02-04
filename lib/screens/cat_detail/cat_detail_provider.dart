import 'package:cat_alogue/models/cat.dart';
import 'package:flutter/material.dart';

class CatDetailProvider extends ChangeNotifier{
  final Cat cat;

  CatDetailProvider(this.cat);
}
