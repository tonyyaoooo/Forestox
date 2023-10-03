import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tonyyaooo/models/discussion_model/discussion_model.dart';
import 'package:tonyyaooo/reusable_widgets/app_bar/custom_appbar.dart';
import 'package:tonyyaooo/screens/home/discussion/controller/discussion_controller.dart';
import 'package:tonyyaooo/screens/home/post_sharing_screen.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../../reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import '../../../../reusable_widgets/custom_divider.dart';
import '../../../../utils/constants/constant_lists.dart';
import '../component/discussion_components.dart';


class DiscussionScreen extends StatefulWidget {
  const DiscussionScreen({super.key});
  @override
  State<DiscussionScreen> createState() => _DiscussionScreen();
}

class _DiscussionScreen extends State<DiscussionScreen> {

  Future<void> fetchChord() async {
    await http.get(Uri.parse('https://tonyintroduction.jackwagner7.repl.co/add/1/2'));
  }



  loadPosts() async{
    await ConstantLists.getDiscussions();
  }

  @override
  Widget build(BuildContext context) {
    final discussionController = Get.find<DiscussionController>();
    var listData = ConstantLists.discussionModelList;

    ListView list = ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: listData.length,
      separatorBuilder: (context, index) => const CustomDividerSecond(),
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: DiscussionPostComponent(
                discussionModel: listData[index],
              ),
            ),
          ),
        );
      },
    );

    if (!ConstantLists.loaded){
      setState(() {
        loadPosts();
        listData = ConstantLists.discussionModelList;
        print(listData);
      });
      ConstantLists.loaded = true;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("post");
          //fetchChord();

          Get.off(
                () => const PostSharing(title: "Discuss"),
            transition: Transition.cupertino,
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          CupertinoIcons.plus
        )
      ),
      appBar: CustomAppBar(
        needActions: true,
        needBackButton: false,
        needTabBar: true,
        tabsList: discussionController.discussionTabs,
        tabOnTapFunction: (index) {
          discussionController.toggleDiscussionTabsList();
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: context.width * 1,
        height: context.height * 1,
        child: AnimationLimiter(
          child: LiquidPullToRefresh(
            onRefresh: () async {
              setState(()  {
                ConstantLists.getDiscussions();
                listData = ConstantLists.discussionModelList;
                print(listData);
                //ConstantLists.discussionModelList.add(DiscussionModel(documentID: "13", discussionPostedByImage: "https://firebasestorage.googleapis.com/v0/b/forestox-ee2a6.appspot.com/o/Jpeg-file.jpg?alt=media&token=9e3e926a-cc35-46e5-8b39-89bb4124778e", discussionPostedByName: "s", postedTimeAgo: 's', postDescription: '"Welcome to Discussions!"', postImage: "https://firebasestorage.googleapis.com/v0/b/forestox-ee2a6.appspot.com/o/Jpeg-file.jpg?alt=media&token=9e3e926a-cc35-46e5-8b39-89bb4124778e", noOfLikes: 1, noOfComments: 1, numbersOfShares: 1));
              });
            },
            child: list
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(selectedIndex: 2),
    );
  }
}
