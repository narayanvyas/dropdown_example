import 'package:dropdown_example/home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MaterialApp(
    title: 'Dropdown Example App',
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
