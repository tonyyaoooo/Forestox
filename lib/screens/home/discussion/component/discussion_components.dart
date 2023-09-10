import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tonyyaooo/generated/assets.dart';
import 'package:tonyyaooo/models/discussion_model/discussion_model.dart';
import 'package:tonyyaooo/utils/gaps/gaps.dart';

import '../../../../utils/text_styles/text_styles.dart';

class DiscussionPostComponent extends StatelessWidget {
  final DiscussionModel discussionModel;

  const DiscussionPostComponent({
    super.key,
    required this.discussionModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              discussionModel.discussionPostedByImage,
              width: 38,
              height: 38,
            ),
            10.pw,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discussionModel.discussionPostedByName,
                    style: CustomTextStyles.black613,
                  ),
                  Text(
                    discussionModel.postedTimeAgo,
                    style: CustomTextStyles.darkColorTwo410,
                  ),
                ],
              ),
            ),
            5.pw,
          ],
        ),
        10.ph,
        Text(
          discussionModel.postDescription,
          style: CustomTextStyles.black413,
        ),
        10.ph,
        Image.asset(discussionModel.postImage),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PostActionComponent(
              iconString: Assets.appIconsHeartIcon,
              number: discussionModel.noOfLikes,
              onTapFunction: () {},
            ),
            PostActionComponent(
              iconString: Assets.appIconsCommentsIcon,
              number: discussionModel.noOfComments,
              onTapFunction: () {},
            ),
            PostActionComponent(
              iconString: Assets.appIconsShareIcon,
              number: discussionModel.numbersOfShares,
              onTapFunction: () {},
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.appIconsSaveIcon,
                height: 18,
                width: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PostActionComponent extends StatelessWidget {
  final String iconString;
  final int number;
  final Function()? onTapFunction;

  const PostActionComponent(
      {super.key,
      required this.iconString,
      required this.number,
      required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onTapFunction,
          icon: SvgPicture.asset(
            iconString,
            height: 18,
            width: 18,
          ),
        ),
        Text(
          number.toString(),
          style: CustomTextStyles.grey413,
        ),
        10.pw,
      ],
    );
  }
}
