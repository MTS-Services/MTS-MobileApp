import 'package:flutter/material.dart';
import 'package:mts_app/src/view/widget/custom_text_form_field.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';

class TodayTaskScreen extends StatelessWidget {
  const TodayTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              CustomTextFormField(),
              Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
