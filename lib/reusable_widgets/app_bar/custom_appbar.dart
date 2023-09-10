import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonyyaooo/reusable_widgets/custom_tab_bar.dart';
import 'package:tonyyaooo/utils/gaps/gaps.dart';
import '../../generated/assets.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool needBackButton, needActions, needTitle, centerTitle, needTabBar;
  final String titleText;
  final double appBarHeight;
  final Function(int)? tabOnTapFunction;
  final List<Widget>? tabsList;

  const CustomAppBar(
      {Key? key,
      this.needBackButton = true,
      this.needTabBar = false,
      this.needActions = false,
      this.needTitle = false,
      this.centerTitle = false,
      this.titleText = "",
      this.tabsList,
      this.tabOnTapFunction,
      this.appBarHeight = 65})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CColors.whiteColor,
      shadowColor: CColors.blackColor.withOpacity(0.1),
      forceMaterialTransparency: false,
      centerTitle: centerTitle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      leading: needBackButton
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: CColors.blackColor,
              ),
            )
          : null,
      leadingWidth: 60,
      title: needTitle
          ? Text(
              titleText,
              style: CustomTextStyles.black620,
            )
          : needTabBar
              ? CustomAppBarTab(
                  onTapFunction: tabOnTapFunction,
                  tabsList: tabsList,
                )
              : null,
      actions: needActions
          ? [
              Image.asset(
                Assets.profileImageProfileImage,
                height: 36,
                width: 36,
              ),
              20.pw,
            ]
          : null,
    );
  }
}
