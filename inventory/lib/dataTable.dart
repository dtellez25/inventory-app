// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:expandable_datatable/expandable_datatable.dart';

const bgColor = Color(0xfffafafa);

class dataTable extends StatefulWidget {
  const dataTable({Key? key}) : super(key: key);

  @override
  State<dataTable> createState() => _dataTableState();
}

// You need to define a User class that matches the structure you're expecting.
class User {
  final String itemName;
  final String category;
  final int quantity;

  User(
      {required this.itemName, required this.category, required this.quantity});
}

class _dataTableState extends State<dataTable> {
  late List<ExpandableColumn<dynamic>> headers;
  late List<ExpandableRow> rows;

  List<User> userList = [
    User(itemName: 'Forks', category: 'Utensils', quantity: 5),
    User(itemName: 'Canned Food', category: 'Food', quantity: 10),
    // Add more users as needed
  ];

  @override
  void initState() {
    super.initState();
    createDataSource();
  }

  void createDataSource() {
    headers = [
      ExpandableColumn<String>(columnTitle: "Item", columnFlex: 3),
      ExpandableColumn<String>(columnTitle: "Category", columnFlex: 3),
      ExpandableColumn<int>(
          columnTitle: "Quantity",
          columnFlex: 2), // Adjusted columnFlex for consistency
    ];

    // Assuming you have a userList defined somewhere with proper fields.
    rows = userList.map<ExpandableRow>((e) {
      return ExpandableRow(cells: [
        ExpandableCell<String>(columnTitle: "Item", value: e.itemName),
        ExpandableCell<String>(columnTitle: "Category", value: e.category),
        ExpandableCell<int>(columnTitle: "Quantity", value: e.quantity),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Table"),
        centerTitle: true,
      ),
      body: ExpandableTheme(
        data: ExpandableThemeData(
          context,
          headerTextStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 15, // Smaller font size
            fontWeight: FontWeight.bold,
          ),
          rowBorder: const BorderSide(color: Colors.amber),
          expandedBorderColor: Colors.transparent,
          paginationSize: 48,
        ),
        child: ExpandableDataTable(
          rows: rows,
          headers: headers,
          visibleColumnCount: 3,
        ),
      ),
    );
  }
}
