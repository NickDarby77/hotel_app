import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_app/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.hotel).existsSync(), isTrue);
    expect(File(AppImages.pooperCelebrate).existsSync(), isTrue);
  });
}
