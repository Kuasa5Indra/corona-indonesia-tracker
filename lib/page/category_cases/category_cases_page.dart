import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:coronaindonesiatracker/api/info_cases/info_cases.dart';

class CategoryCasesPage extends StatelessWidget {
  final Cases info;
  final String date;

  CategoryCasesPage({Key key, this.info, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              heightFactor: 4.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Update Terbaru'),
                  Text(DateFormat.yMMMMd().format(DateTime.parse(date)))
                ],
              ),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Kondisi')),
                DataColumn(label: Text('Persen')),
              ],
              rows: info.condition.listData
                  .map((index) => DataRow(cells: [
                DataCell(
                    Text(index.key)
                ),
                DataCell(
                    Text(double.parse((index.docCount).toStringAsFixed(2)).toString())
                )
              ])).toList(),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Jenis Kelamin')),
                DataColumn(label: Text('Persen')),
              ],
              rows: info.gender.listData
                  .map((index) => DataRow(cells: [
                DataCell(
                    Text(index.key)
                ),
                DataCell(
                    Text(double.parse((index.docCount).toStringAsFixed(2)).toString())
                )
              ])).toList(),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Kelompok Umur')),
                DataColumn(label: Text('Persen')),
              ],
              rows: info.ageGroup.listData
                  .map((index) => DataRow(cells: [
                DataCell(
                    Text(index.key)
                ),
                DataCell(
                    Text(double.parse((index.docCount).toStringAsFixed(2)).toString())
                )
              ])).toList(),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Gejala')),
                DataColumn(label: Text('Persen')),
              ],
              rows: info.symptoms.listData
                  .map((index) => DataRow(cells: [
                DataCell(
                    Text(index.key)
                ),
                DataCell(
                    Text(double.parse((index.docCount).toStringAsFixed(2)).toString())
                )
              ])).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

