import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';

import '../../../core/app_colors.dart';
import '../../../utils/helper/helper_function.dart';
import '../controllers/calander_controller.dart';
import '../widget/custom_container.dart';
import '../widget/data_table_widget.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final DateTimeController dateTime = Get.put(DateTimeController());
  List<String> headers = [
    'Client Name',
    'Project Price',
    'Achieve Price',
    'Leader Comment',
    'Your Comments',
  ];
  List<Map<String, dynamic>> projectData = [
    {
      'clientName': 'John Doe',
      'projectPrice': 5000,
      'achivePrice': 4500,
      'leaderComment': 'Well done',
      'yourComment': 'Great collaboration'
    },
    {
      "clientName": "Acme Corp",
      "projectPrice": 8000,
      "achivePrice": 8000,
      "leaderComment": "Perfect delivery",
      "yourComment": "Smooth process"
    },
    {
      "clientName": "Jane Smith",
      "projectPrice": 6500,
      "achivePrice": 6000,
      "leaderComment": "Needs improvement",
      "yourComment": "Faced some challenges"
    },
    {
      "clientName": "TechNova",
      "projectPrice": 7200,
      "achivePrice": 7000,
      "leaderComment": "Great pace",
      "yourComment": "Quick turnaround"
    },
    {
      "clientName": "Creative Solutions",
      "projectPrice": 9000,
      "achivePrice": 8800,
      "leaderComment": "Excellent planning",
      "yourComment": "Loved the teamwork"
    },
    {
      "clientName": "FutureX",
      "projectPrice": 10000,
      "achivePrice": 9500,
      "leaderComment": "Outstanding work",
      "yourComment": "Learned a lot"
    },
    {
      "clientName": "InnoSoft",
      "projectPrice": 4500,
      "achivePrice": 4200,
      "leaderComment": "Satisfactory",
      "yourComment": "Minor delays handled well"
    },
  ];


  @override
  Widget build(BuildContext context) {
    print(projectData);
    final dark = HelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 5),
              _buildCalender(dateTime, context, "Last Quarter"),
              SizedBox(height:15),
              SizedBox(
                height: size.height * 0.10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      // spacing between items
                      child: CustomContainer(
                        bgColor:
                            dark ? AppColors.primaryDark : AppColors.primaryLight,
                        height: size.height * 0.10,
                        width: size.width * 0.42,
                        fontSize: 14,
                        title: 'Individual Target',
                        count: '10',
                        txColor: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              _buildCalender(dateTime, context, "Current Month"),
              SizedBox(height: 10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 15,
                  childAspectRatio: 2.0,
                ),
                itemBuilder: (context, index) {
                  return CustomContainer(
                      bgColor:
                      dark ? AppColors.primaryDark : AppColors.primaryLight,
                      height: size.height * 0.05,
                      width: size.width * 0.42,
                      fontSize: 16,
                      title: 'Worked Count',
                      count: '3000',
                      txColor: AppColors.getCountColors(dark)[index]);
                },
              ),
              ReusableDataTable(
                tableHeaders:headers,
                tableData: projectData,
                evenRowColor: AppColors.secondaryDark,
                oddRowColor: AppColors.primaryLight,
                headerColor:
                dark ? AppColors.secondaryDark : AppColors.primaryLight,
                headerTextColor:AppColors.backgroundLight,
                cellTextColor: AppColors.backgroundLight,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalender(
    DateTimeController dateTime,
    BuildContext context,
    String txt,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  DateFormat('yyyy.MM.dd')
                      .format(dateTime.selectDateTime.value),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => dateTime.pickDate(context),
              child: Icon(
                Icons.calendar_month,
              ),
            ),
          ],
        ),

      ],
    );
  }
}
