import 'package:flutter/material.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';

class TodayTaskScreen extends StatelessWidget {
  const TodayTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: GestureDetector(
            onTap: () {},
            child: Icon(Icons.menu)),
      ),
    );
  }
}
