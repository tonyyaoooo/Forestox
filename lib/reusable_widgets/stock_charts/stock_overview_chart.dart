import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tonyyaooo/utils/text_styles/text_styles.dart';

import '../../utils/colors/app_colors.dart';

class StockOverviewChart extends StatelessWidget {
  const StockOverviewChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(
          show: false,
          drawVerticalLine: false,
        ),
        titlesData: const FlTitlesData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
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
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 3.1),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            color: CColors.greenColor,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: CColors.chartGradient
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
