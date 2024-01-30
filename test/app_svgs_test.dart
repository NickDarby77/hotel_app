import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_app/resources/resources.dart';

void main() {
  test('app_svgs assets test', () {
    expect(File(AppSvgs.addForm).existsSync(), isTrue);
    expect(File(AppSvgs.arrowForward).existsSync(), isTrue);
    expect(File(AppSvgs.closeSquare).existsSync(), isTrue);
    expect(File(AppSvgs.emojiHappy).existsSync(), isTrue);
    expect(File(AppSvgs.star).existsSync(), isTrue);
    expect(File(AppSvgs.tickSquare).existsSync(), isTrue);
  });
}
