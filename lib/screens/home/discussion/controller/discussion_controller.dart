import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscussionController extends GetxController {
  List<Widget> discussionTabs = const [
    Tab(
      child: Text("For You"),
    ),
    Tab(
      child: Text("Collected"),
    ),
  ];

  toggleDiscussionTabsList() {}
}
