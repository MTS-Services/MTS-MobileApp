import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/demo_api.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({super.key});

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  final List<String> tableHeaders = [
    'Date',
    'Account',
    'Client Name',
    'Operation-Status',
    'Sheet link',
    'Ordered by',
    'Delivery Last Date',
    'Profile Status',
    'After Fiverr',
    'Tips',
    'Rating',
  ];



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: DemoApi.tableData.isNotEmpty ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DataTable(
          border: TableBorder.all(color:Colors.white, width: 1),
          columns: tableHeaders
              .map(
                (header) => DataColumn(
              label: Text(
                header,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          )
              .toList(),
          rows: DemoApi.tableData.asMap().entries.map((entry) {
            final rowIndex = entry.key;
            final dataRow = entry.value;
            return DataRow(
              color: MaterialStateProperty.all(
                rowIndex % 2 == 0 ? AppColors.secondaryColor : AppColors.primaryColor,
              ),
              cells: tableHeaders.map((header) {
                return DataCell(
                  Text(
                    dataRow[header]?.toString() ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            );

          }).toList(),

        ),
      ),

    );
  }
}
