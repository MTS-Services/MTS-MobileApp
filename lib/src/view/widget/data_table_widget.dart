import 'package:flutter/material.dart';

class ReusableDataTable extends StatelessWidget {
  final List<String> tableHeaders;
  final List<Map<String, dynamic>> tableData;
  final Color evenRowColor;
  final Color oddRowColor;
  final Color headerColor;
  final Color headerTextColor;
  final Color cellTextColor;

  const ReusableDataTable({
    super.key,
    required this.tableHeaders,
    required this.tableData,
    required this.evenRowColor ,
    required  this.oddRowColor ,
    required this.headerColor,
    required this.headerTextColor,
    required this.cellTextColor ,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: headerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DataTable(
          border: TableBorder.all(color: Colors.white, width: 1),
          columns: tableHeaders
              .map(
                (header) => DataColumn(
              label: Text(
                header,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: headerTextColor,
                  fontSize: 14,
                ),
              ),
            ),
          )
              .toList(),
          rows: tableData.asMap().entries.map((entry) {
            final rowIndex = entry.key;
            final dataRow = entry.value;
            return DataRow(
              color: MaterialStateProperty.all(
                (rowIndex % 2 == 0) ? evenRowColor : oddRowColor,
              ),
              cells: tableHeaders.map((header) {
                return DataCell(
                  Text(
                    dataRow[header]?.toString() ?? '',
                    style: TextStyle(color: cellTextColor),
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
