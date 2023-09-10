import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tonyyaooo/reusable_widgets/app_bar/custom_appbar.dart';
import 'package:tonyyaooo/reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import 'package:tonyyaooo/utils/gaps/gaps.dart';

import '../../../../../reusable_widgets/text_field/search_text_field.dart';
import '../../../../../utils/constants/constant_lists.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../component/stocks_landing_component.dart';
import '../controller/stocks_landing_controller.dart';

class StocksLandingScreen extends StatelessWidget {
  const StocksLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stocksLandingController = Get.find<StocksLandingController>();
    return Scaffold(
      appBar: const CustomAppBar(
        needBackButton: false,
        titleText: "Stocks",
        needTitle: true,
        needActions: true,
      ),
      body: Container(
        height: context.height * 1,
        width: context.width * 1,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SearchTextField(
                      textEditingController:
                          stocksLandingController.searchTextController,
                      hintText: "Search Here",
                      width: context.width * 1,
                    ),
                  ),
                  5.ph,
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "All Stocks",
                      style: CustomTextStyles.black620,
                    ),
                  ),
                  5.ph,
                  AnimationLimiter(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ConstantLists.stocksModelList.length,
                      separatorBuilder: (context, index) => 20.ph,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: StocksLandingWidget(
                                stocksModel:
                                    ConstantLists.stocksModelList[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(selectedIndex: 0),
    );
  }
}
