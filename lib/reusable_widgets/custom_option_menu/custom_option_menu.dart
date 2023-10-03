import 'package:flutter/material.dart';
import 'package:tonyyaooo/utils/alignment/widget_alignment.dart';
import '../../common_components/white_background_background.dart';
import '../../generated/assets.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class StockAnalysisAndMenuMoreOption extends StatelessWidget {
  final Offset offset;

  const StockAnalysisAndMenuMoreOption({
    Key? key,
    this.offset = const Offset(0, 40),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      constraints: BoxConstraints(
        minWidth: 2.0 * 56.0,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      offset: offset,
      elevation: 0.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      color: CColors.whiteColor,
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          onTap: () {
            print("more");
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        ),
      ],
      child: WhiteContainerBackground(
        childWidget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FittedBox(
              child: Text(
                "More",
                style: CustomTextStyles.black608,
              ),
            ),
            Expanded(
              child: Image.asset(
                Assets.appIconsMoreIcon,
                color: CColors.blackColor,
                width: 18,
              ).alignWidget(alignment: Alignment.center),
            ),
          ],
        ),
      ),
    );
  }
}
