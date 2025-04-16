import 'package:flutter/material.dart';
import 'package:mts_app/src/view/widget/custom_appbar.dart';
import 'package:mts_app/src/view/widget/cutom_drawer.dart';
import '../widget/custom_container.dart';
import '../widget/custom_drop_down_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> filterOptions = [
    "Filter by Account",
    "Filter by Status",
    "Filter by order by",
  ];

  // Selected item (initially first one)
  String selectedFilter = "Filter by Account";

  @override
  Widget build(BuildContext context) {
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
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.0,
                ),
                itemBuilder: (context, index) {
                  return CustomContainer(
                    height: size.height * 0.05,
                    width: size.width * 0.42,
                    fontSize: 18,
                    title: 'Total Delivered',
                    count: '5000',
                  );
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
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                borderColor: Colors.lightBlueAccent,
                                height: size.height / 16,
                                width: size.width * 0.44,
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
          ],
        ),
      ),
    );
  }
}
