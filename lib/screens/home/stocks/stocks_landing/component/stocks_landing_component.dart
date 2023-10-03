import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonyyaooo/screens/home/stocks/stock_detail/view/stock_detail_screen.dart';
import 'package:tonyyaooo/utils/alignment/widget_alignment.dart';
import 'package:tonyyaooo/utils/gaps/gaps.dart';
import 'package:tonyyaooo/utils/text_styles/text_styles.dart';

import '../../../../../models/stocks_model/stocks_model.dart';
import '../../../../../reusable_widgets/stock_charts/stock_overview_chart.dart';
import '../../../../../utils/colors/app_colors.dart';

class StocksLandingWidget extends StatelessWidget {
  final StocksModel stocksModel;

  const StocksLandingWidget({
    super.key,
    required this.stocksModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: context.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 0.0,
            color: CColors.blackColor.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          stocksModel.companyName,
                          style: CustomTextStyles.black716,
                        ),
                        5.pw,
                        CorporationContainer(
                          childWidget: Text(
                            stocksModel.corporateName,
                            style: CustomTextStyles.black508,
                          ),
                        )
                      ],
                    ),
                    5.ph,
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: "Public Opinion: ",
                              style: CustomTextStyles.darkColorTwo508),
                          TextSpan(
                            text: stocksModel.publicOpinion,
                            style: stocksModel.publicOpinion == "Positive"
                                ? CustomTextStyles.green508
                                : stocksModel.publicOpinion == "Negative"
                                    ? CustomTextStyles.red508
                                    : stocksModel.publicOpinion == "Neutral"
                                        ? CustomTextStyles.darkColorTwo508
                                        : CustomTextStyles.green508,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                PropertiesOverviewBackgroundContainer(
                  childWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Price:",
                        style: CustomTextStyles.black612,
                      ),
                      5.pw,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$${stocksModel.price}",
                            style: CustomTextStyles.black413,
                          ),
                          2.ph,
                          Text(
                            stocksModel.pricePercentageRaise,
                            style: stocksModel.pricePercentageRaise[0] == "+"
                                ? CustomTextStyles.green510
                                : stocksModel.pricePercentageRaise[0] == "-"
                                    ? CustomTextStyles.red510
                                    : CustomTextStyles.green510,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PropertiesOverviewBackgroundContainer(
                  childWidget: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Public attention:",
                        style: CustomTextStyles.black612,
                      ),
                      5.ph,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            stocksModel.publicAttention,
                            style: CustomTextStyles.black413,
                          ),
                          8.pw,
                          Text(
                            stocksModel.publicPercentageAttention,
                            style: stocksModel.publicPercentageAttention[0] ==
                                    "+"
                                ? CustomTextStyles.green510
                                : stocksModel.publicPercentageAttention[0] ==
                                        "-"
                                    ? CustomTextStyles.red510
                                    : CustomTextStyles.green510,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PropertiesOverviewBackgroundContainer(
                  childWidget: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Prediction Price:",
                        style: CustomTextStyles.black612,
                      ),
                      5.ph,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            stocksModel.predictionPrice,
                            style: CustomTextStyles.black413,
                          ),
                          8.pw,
                          Text(
                            stocksModel.predictionPercentagePrice,
                            style: stocksModel.predictionPercentagePrice[0] ==
                                    "+"
                                ? CustomTextStyles.green510
                                : stocksModel.predictionPercentagePrice[0] ==
                                        "-"
                                    ? CustomTextStyles.red510
                                    : CustomTextStyles.green510,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ).alignWidget(alignment: Alignment.centerLeft),
          ),
          5.pw,
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price:",
                      style: CustomTextStyles.black712,
                    ),
                    2.ph,
                    const SizedBox(
                      height: 40,
                      child: StockOverviewChart(),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Social Index:",
                      style: CustomTextStyles.black712,
                    ),
                    2.ph,
                    const SizedBox(
                      height: 40,
                      child: StockOverviewChart(),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    Get.to(
                      () => StockDetailScreen(stocksModel),
                      transition: Transition.fadeIn,
                    );
                  },
                  child: const Text(
                    "View more",
                    style: CustomTextStyles.blue713,
                  ).paddingSymmetric(horizontal: 5),
                ),
              ],
            ).alignWidget(
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}

class CorporationContainer extends StatelessWidget {
  final Widget? childWidget;

  const CorporationContainer({
    super.key,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: CColors.greyAccentTwoColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: childWidget,
    );
  }
}

class PropertiesOverviewBackgroundContainer extends StatelessWidget {
  final Widget? childWidget;

  const PropertiesOverviewBackgroundContainer({
    super.key,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: CColors.scaffoldColorTwo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: childWidget,
    );
  }
}
