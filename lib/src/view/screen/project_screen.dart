import 'package:flutter/material.dart';
import 'package:mts_app/core/app_colors.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';
import 'package:mts_app/src/view/widget/data_table_widget.dart';
import 'package:mts_app/utils/helper/helper_function.dart';
import '../widget/custom_container.dart';
import '../widget/custom_drop_down_button.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  List<String> filterOptions = [
    "Filter by Account",
    "Filter by Status",
    "Filter by order by",
  ];
  String selectedFilter = "Filter by Account";

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
              child: GridView.builder(
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
                      fontSize: 14,
                      title: 'Total Delivered',
                      count: '5000',
                      txColor:  AppColors.getCountColors(dark)[index]);
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filterOptions.length + 1,
                itemBuilder: (context, index) {
                  return index == 3
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedFilter = filterOptions[0]; // Reset
                            });
                          },
                          child: const Text(
                            "Filter Reset",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: CustomDropdownButton(
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
                            ),
                          ],
                        );
                },
              ),
            ),
            DataTableWidget()
          ],
        ),
      ),
    );
  }
}
