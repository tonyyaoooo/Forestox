import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tonyyaooo/common_components/white_background_background.dart';
import 'package:tonyyaooo/reusable_widgets/app_bar/custom_appbar.dart';
import 'package:tonyyaooo/reusable_widgets/custom_tab_bar.dart';
import 'package:tonyyaooo/screens/home/stocks/stock_detail/component/stock_detail_component.dart';
import 'package:tonyyaooo/screens/home/stocks/stock_detail/controller/stock_detail_controller.dart';
import 'package:tonyyaooo/utils/gaps/gaps.dart';

import '../../../../../models/stocks_model/stocks_model.dart';
import '../../../../../reusable_widgets/stock_charts/stock_detail_chart.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class StockDetailScreen extends StatefulWidget {
  const StockDetailScreen(this.title);

  final StocksModel title;


  @override
  State<StockDetailScreen> createState() => _StockDetailState(title);
}

/*import yfinance as yf
stock_obj = yf.Ticker("GME")
# Here are some fixs on the JSON it returns
validated = str(stock_obj.info).replace("'","\"").replace("None", "\"NULL\"").replace("False", "\"FALSE\"").replace("True", "\"TRUE\"")
# Parsing the JSON here
meta_obj = json.loads(validated)

# Some of the short fields
print("sharesShort: "+str( meta_obj['sharesShort']))
print("shortRatio: "+str( meta_obj['shortRatio']))
print("shortPercentOfFloat: "+str( meta_obj['shortPercentOfFloat']))*/

class _StockDetailState extends State<StockDetailScreen> {
  late StocksModel stocksModel;

  _StockDetailState(this.stocksModel){
    SelectChord();
  }
  String test = "";
  Future<void> SelectChord() async {
    print("hello trying to select a chord");
    Map<String, String> headers = {
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000"
    };

    http.MultipartRequest request = http.MultipartRequest(
        'POST', Uri.parse('https://tonyintroduction.jackwagner7.repl.co/getStockName')); //post request to URL/analize
    request.headers.addAll(headers);

    await request.send().then((r) async {
      print(r.statusCode);
      if (r.statusCode == 200) {
        r.stream.bytesToString().then((value) {
          print(jsonDecode(value));
          setState(() {
            //test = jsonDecode(value).toString();
          });
        }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockDetailController = Get.find<StockDetailController>();
    return Scaffold(
      appBar: CustomAppBar(
        needBackButton: true,
        needTitle: true,
        titleText: stocksModel.corporateName,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: context.height * 1,
        width: context.width * 1,
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        stocksModel.companyImage,
                        width: 40,
                        height: 40,
                      ),
                      10.pw,
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stocksModel.companyName,
                              style: CustomTextStyles.black716,
                            ),
                            Text(
                              stocksModel.corporateName,
                              style: CustomTextStyles.darkColorTwo412,
                            ),
                          ],
                        ),
                      ),
                      5.pw,
                    ],
                  ),
                  20.ph,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$${stocksModel.price}",
                        style: CustomTextStyles.black636,
                      ),
                      10.pw,
                      PricePercentageRiseWidget(
                          pricePercentageRaise:
                              stocksModel.pricePercentageRaise),
                      5.pw,
                    ],
                  ),
                  20.ph,
                  const Text(
                    "Price:",
                    style: CustomTextStyles.black718,
                  ),
                  20.ph,
                  WhiteContainerBackground(
                    height: 230,
                    borderRadius: 15,
                    childWidget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StockGraphTabBar(
                            onTapFunction: (index) {
                              stockDetailController.toggleSpanTabsList();
                            },
                            tabsList: stockDetailController.timeSpanTabs),
                        const Expanded(
                          child: StockDetailChart(),
                        ),
                      ],
                    ),
                  ),
                  20.ph,
                  const Text(
                    "Social Index:",
                    style: CustomTextStyles.black718,
                  ),
                  20.ph,
                  WhiteContainerBackground(
                    height: 230,
                    borderRadius: 15,
                    childWidget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StockGraphTabBar(
                            onTapFunction: (index) {
                              stockDetailController.toggleSpanTabsList();
                            },
                            tabsList: stockDetailController.timeSpanTabs),
                        const Expanded(
                          child: StockDetailChart(),
                        ),
                      ],
                    ),
                  ),
                  20.ph,
                  const Text(
                    "Prediction Price:",
                    style: CustomTextStyles.black718,
                  ),
                  20.ph,
                  PredictionPriceWidget(
                    predictionPrice: stocksModel.predictionPrice,
                    predictionPercentagePrice:
                        stocksModel.predictionPercentagePrice,
                  ),
                  20.ph,
                  const Text(
                    "AI Analysis & Suggestions",
                    style: CustomTextStyles.blue515,
                  ),
                  20.ph,
                  Text(
                    stocksModel.aiSuggestionAndAnalysis,
                    style: CustomTextStyles.black413,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
