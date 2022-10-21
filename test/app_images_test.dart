import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rickmorty/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.arrowB).existsSync(), true);
    expect(File(AppImages.arrowF).existsSync(), true);
    expect(File(AppImages.episodes).existsSync(), true);
    expect(File(AppImages.filterIcon).existsSync(), true);
    expect(File(AppImages.lineIcon).existsSync(), true);
    expect(File(AppImages.mortyAvaSet2x).existsSync(), true);
    expect(File(AppImages.navbar1).existsSync(), true);
    expect(File(AppImages.navbar2).existsSync(), true);
    expect(File(AppImages.navbar3).existsSync(), true);
    expect(File(AppImages.navbar4).existsSync(), true);
    expect(File(AppImages.not).existsSync(), true);
    expect(File(AppImages.rickBlurred).existsSync(), true);
    expect(File(AppImages.searchIcon).existsSync(), true);
    expect(File(AppImages.test).existsSync(), true);
    expect(File(AppImages.theme).existsSync(), true);
    expect(File(AppImages.vector).existsSync(), true);
    expect(File(AppImages.view).existsSync(), true);
    expect(File(AppImages.viewGrid).existsSync(), true);
  });
}
