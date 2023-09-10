import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class StockDetailChart extends StatefulWidget {
  const StockDetailChart({super.key});

  @override
  State<StockDetailChart> createState() => _StockDetailChartState();
}

class _StockDetailChartState extends State<StockDetailChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 18,
        left: 12,
        top: 24,
        bottom: 12,
      ),
      child: LineChart(
        mainData(),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('6:00', style: CustomTextStyles.greyAccentThree510);
        break;
      case 2:
        text = const Text('10:00', style: CustomTextStyles.greyAccentThree510);
        break;
      case 3:
        text = const Text('14:00', style: CustomTextStyles.greyAccentThree510);
        break;
      case 4:
        text = const Text('18:00', style: CustomTextStyles.greyAccentThree510);
        break;
      case 5:
        text = const Text('22:00', style: CustomTextStyles.greyAccentThree510);
        break;
      case 6:
        text = const Text('2:00', style: CustomTextStyles.greyAccentThree510);
        break;
      default:
        text = const Text('', style: CustomTextStyles.greyAccentThree510);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = '   192';
        break;
      case 2:
        text = '   194';
        break;
      case 3:
        text = '   196';
        break;
      case 4:
        text = '   198';
        break;
      case 5:
        text = '   200';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: CustomTextStyles.greyAccentThree510, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 4,
          tooltipBgColor: CColors.whiteColor,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              return LineTooltipItem(
                "\$${touchedSpot.y.toString()}",
                CustomTextStyles.darkColorThree710,
                children: const [
                  TextSpan(
                    text: "\n",
                  ),
                  TextSpan(
                    text: "28 Oct 2023 - 22:00",
                    style: CustomTextStyles.greyAccentThree510,
                  ),
                  TextSpan(
                    text: "\n",
                  ),
                  TextSpan(
                    text: "Volume: 102K",
                    style: CustomTextStyles.greyAccentThree510,
                  ),
                ],
                textAlign: TextAlign.left,
              );
            }).toList();
          },
        ),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(3, 4),
            FlSpot(4, 3.5),
            FlSpot(5, 4.5),
            FlSpot(6, 5)
          ],
          isCurved: true,
          color: CColors.greenColor,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: CColors.chartGradient
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
