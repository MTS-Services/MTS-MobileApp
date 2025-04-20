import 'package:flutter/material.dart';
import 'package:mts_app/src/view/widget/custom_container.dart';
import 'package:mts_app/src/view/widget/custom_text_form_field.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';

import '../../../core/app_colors.dart';
import '../../../utils/helper/helper_function.dart';
import '../widget/custom_drop_down_button.dart';
import '../widget/data_table_widget.dart';

class TodayTaskScreen extends StatefulWidget {
  const TodayTaskScreen({super.key});

  @override
  State<TodayTaskScreen> createState() => _TodayTaskScreenState();
}

class _TodayTaskScreenState extends State<TodayTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    List<String> filterOptions = [
      "Filter by Account",
      "Filter by Status",
      "Filter by order by",
    ];
    String selectedFilter = "Filter by Account";
    List<String> tableHeaders = [
      'Client Name',
      'Last Update',
      'Assign',
      'Expect Finish Time',
      'Status',
      'Delivery Last Date',
    ];
    List<Map<String, String>> tableData = [
      {
        'Client Name': 'Client A',
        'Last Update': '2025-04-19',
        'Assign': 'John',
        'Expect Finish Time': '2025-04-22',
        'Status': 'In Progress',
        'Delivery Last Date': '2025-04-18',
      },
      {
        'Client Name': 'Client B',
        'Last Update': '2025-04-18',
        'Assign': 'Alice',
        'Expect Finish Time': '2025-04-23',
        'Status': 'Pending',
        'Delivery Last Date': '2025-04-17',
      },
    ];


    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFormField(),
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.12, // Increased height to fit the widget properly
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10), // spacing between items
                      child: CustomContainer(
                        bgColor: dark
                            ? AppColors.primaryDark
                            : AppColors.primaryLight,
                        height: size.height * 0.12,
                        width: size.width * 0.42,
                        fontSize: 14,
                        title: 'Total Revision',
                        count: '10',
                        txColor: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  CustomDropdownButton(
                    backgroundColor: dark
                        ? AppColors.secondaryLight
                        : Colors.white,
                    textColor: dark
                        ? Colors.white
                        : AppColors.secondaryLight,
                    borderColor: dark ? Colors.white : Colors.blue,
                    height: size.height / 16,
                    width: size.width * 0.44,
                    fontSize: 12,
                    selectedValue: selectedFilter,
                    items: filterOptions,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedFilter = value;
                        });
                      }
                    },
                  ),
                  SizedBox(width: 20),
                  CustomDropdownButton(
                    backgroundColor: dark
                        ? AppColors.secondaryLight
                        : Colors.white,
                    textColor: dark
                        ? Colors.white
                        : AppColors.secondaryLight,
                    borderColor: dark ? Colors.white : Colors.blue,
                    height: size.height / 16,
                    width: size.width * 0.44,
                    fontSize: 12,
                    selectedValue: selectedFilter,
                    items: filterOptions,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedFilter = value;
                        });
                      }
                    },
                  )
                ],
              ),
              ReusableDataTable(
                tableHeaders:tableHeaders,
                tableData: tableData,
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
}
