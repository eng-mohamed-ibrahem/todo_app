import 'package:flutter/material.dart';
import 'package:to_do_app/controller/shred_helper/shared_helper.dart';
import 'package:to_do_app/root/root_app.dart';
import 'controller/util/constants/scroll_controller.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  ListViewController.init();
  runApp(const RootApp());
}
