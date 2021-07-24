import 'dart:convert' as json;

import 'package:cat_alogue/models/cat/cat.dart';
import 'package:cat_alogue/models/media_item/media_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Cat to JSON', () {
    final Cat cat = Cat(
      id: 'test-id',
      name: 'Shifty',
      isFavourite: true,
      description: 'Test description',
      profileImg: MediaItem(
        source: MediaSource.local,
        type: MediaType.image,
        urlPath: '',
      ),
    );

    const encoder = json.JsonEncoder.withIndent('    ');
    final pretty = encoder.convert(cat.toJson());
    pretty.split('\n').forEach((dynamic element) => print(element));
  });
}
