import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/custom_container.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';

import '../../../core/app_colors.dart';
import '../../../utils/helper/helper_function.dart';
import '../widget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.23,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 15,
                      childAspectRatio: 2.0),
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      szWidth: 10,
                      icon: Icons.person,
                      bgColor:
                          dark ? AppColors.primaryDark : AppColors.primaryLight,
                      height: size.height * 0.05,
                      width: size.width * 0.42,
                      fontSize: 14,
                      title: 'Each Profiles',
                      count: '5000',
                      horizontal: 25,
                      txColor: AppColors.getCountColors(dark)[index],
                    );
                  },
                ),
              ),
              CustomText(text: 'Individual Profile'),
              SizedBox(height: 10),
              _buildLineChart(dark),
              SizedBox(height: 10),
              CustomText(text: 'Projects Distributions'),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildLineChart(bool dark) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
          color: dark ? AppColors.secondaryDark : AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: dark
                    ? AppColors.primaryLight.withOpacity(0)
                    : Colors.grey.shade500,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(2, 2))
          ]),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: [
                FlSpot(0, 3000),
                FlSpot(1, 5000),
                FlSpot(2, 4000),
                FlSpot(3, 7000),
                FlSpot(4, 5000),
                FlSpot(5, 9000),
                FlSpot(6, 4000),
              ],
              color: dark ? AppColors.ctaDark : AppColors.primaryLight,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
              drawBelowEverything: true,
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: dark ? AppColors.ctaDark : AppColors.primaryLight,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1000,
                getTitlesWidget: (value, meta) {
                  String label = '${(value / 1000).toStringAsFixed(0)}k';
                  return Text(
                    label,
                    style: TextStyle(
                      color: dark ? AppColors.ctaDark : AppColors.primaryLight,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              width: 2,
              color: dark ? AppColors.ctaDark : AppColors.primaryLight,
            ),
          ),
          gridData: FlGridData(show: true),
        ),
      ),
    );
  }
}
