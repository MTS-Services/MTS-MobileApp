import 'package:flutter/material.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Column(
      children: [

      ],
      ),
    );

  }
}
