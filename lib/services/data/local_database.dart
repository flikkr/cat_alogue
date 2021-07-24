import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;

class LocalDatabase {
  static List<String>? avatarPaths;

  static Future<void> init() async {
    Hive.initFlutter();
  }

  static Future<List<String>?> loadAvatars(BuildContext context) async {
    if (avatarPaths != null) return avatarPaths;

    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final paths = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith('assets/avatars'))
        .toList() as List<String>?;

    return avatarPaths = paths;
  }
}
