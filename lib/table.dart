import 'package:flutter/material.dart';

class Table extends StatefulWidget {
  const Table({Key? key}) : super(key: key);

  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<Table> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Complaints Management'),
          ),
          body: ListView(children: <Widget>[
            DataTable(
              columns: const [
                DataColumn(
                    label: Text('ID',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Type of Complaint',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Complaint Description',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Department',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Actor')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('John')),
                  DataCell(Text('Student')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('Harry')),
                  DataCell(Text('Leader')),
                ]),
                DataRow(cells: [
                  DataCell(Text('15')),
                  DataCell(Text('Peter')),
                  DataCell(Text('Scientist')),
                ]),
              ],
            ),
          ])),
    );
  }
}
