import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DateTimeController extends GetxController {
  var selectDateTime = DateTime.now().obs;

  void changeDate(int days) {
    selectDateTime.value = selectDateTime.value.add(Duration(days: days));
  }

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectDateTime.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectDateTime.value = pickedDate;
    }
  }
}
