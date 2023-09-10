import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tonyyaooo/reusable_widgets/app_bar/custom_appbar.dart';
import 'package:tonyyaooo/screens/home/discussion/controller/discussion_controller.dart';

import '../../../../reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import '../../../../reusable_widgets/custom_divider.dart';
import '../../../../utils/constants/constant_lists.dart';
import '../component/discussion_components.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discussionController = Get.find<DiscussionController>();
    return Scaffold(
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
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: ConstantLists.discussionModelList.length,
            separatorBuilder: (context, index) => const CustomDividerSecond(),
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: DiscussionPostComponent(
                      discussionModel: ConstantLists.discussionModelList[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(selectedIndex: 2),
    );
  }
}
