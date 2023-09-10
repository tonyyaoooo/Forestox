import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:tonyyaooo/reusable_widgets/text_field/search_text_field.dart';
import 'package:tonyyaooo/utils/constants/constant_lists.dart';
import 'package:tonyyaooo/utils/gaps/gaps.dart';
import 'package:tonyyaooo/utils/text_styles/text_styles.dart';

import '../../../../../reusable_widgets/app_bar/custom_appbar.dart';
import '../../../../../reusable_widgets/bottom_nav_bar/reusable_bottom_navbar.dart';
import '../component/forecast_landing_components.dart';
import '../controller/forecast_landing_controller.dart';

class ForecastLandingScreen extends StatelessWidget {
  const ForecastLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forecastLandingController = Get.find<ForecastLandingController>();
    return Scaffold(
      appBar: const CustomAppBar(
        needBackButton: false,
        titleText: "Forecast",
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
                          forecastLandingController.searchTextController,
                      hintText: "Search Here",
                      width: context.width * 1,
                    ),
                  ),
                  5.ph,
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "All Forecasts",
                      style: CustomTextStyles.black620,
                    ),
                  ),
                  5.ph,
                  AnimationLimiter(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ConstantLists.forecastModelList.length,
                      separatorBuilder: (context, index) => 20.ph,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: ForeCastDisplayWidget(
                                forecastModel:
                                    ConstantLists.forecastModelList[index],
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
      bottomNavigationBar: const CustomBottomAppBar(selectedIndex: 1),
    );
  }
}
