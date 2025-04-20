
import 'package:flutter/material.dart';
import 'package:mts_app/core/app_colors.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';

import '../../../utils/helper/helper_function.dart';

class EmployeesListScreen extends StatefulWidget {
  const EmployeesListScreen({super.key});

  @override
  State<EmployeesListScreen> createState() => _EmployeesListScreenState();
}

class _EmployeesListScreenState extends State<EmployeesListScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: dark
                              ? AppColors.secondaryDark
                              : AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: () {},
                        title: Text(
                          "Name",
                          style: TextStyle(
                            color: dark
                                ? AppColors.ctaActiveDark
                                : AppColors.secondaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("development",
                            style: TextStyle(
                              color: dark
                                  ? AppColors.ctaTextActiveDark
                                  : AppColors.secondaryDark,
                            )),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
