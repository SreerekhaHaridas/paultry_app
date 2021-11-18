// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, non_constant_identifier_names, unnecessary_new, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportByBatch extends StatefulWidget {
  late int NumberOfChicken;
  late int Numberdead;
  late int AverageWeight;
  @override
  _ReportByBatchState createState() => _ReportByBatchState();
}

class _ReportByBatchState extends State<ReportByBatch> {
  DateTime selectedDate = DateTime.now();
  late String date1;
  late int NumberOfChicken;
  late int Numberdead;
  late int AverageWeight;

  TextEditingController DateInputController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report By Batch"),
        backgroundColor: Colors.orangeAccent,
      ),
      // body: reportBuilder(context, state),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Date',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.black38,
                        ),
                      ),
                      onSaved: (String? value) {
                        // chick.Date = value! as DateTime;
                      },
                      controller: DateInputController,
                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: 15,
          ),
          // Flexible(
          //   flex: 25,
          //   child: BlocBuilder<ReportblocCubit, ReportblocState>(
          //     builder: (context, state) {
          //       if (state is reportFetching) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else if (state is reportError) {
          //         return Center(
          //           child: Text(state.msg),
          //         );
          //       } else if (state is reportReady ) {
          //         final List data = state.data;
          //         return ListView.builder(
          //             itemCount: data.length,
          //             itemBuilder: (context, index) {
          //               return Card(
          //                 child: ExpansionTile(
          //                   title: Center(
          //                     child: Text(
          //                       data[index]['_source']['FarmName'] ?? 'NO TAG',
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.black,
          //                       ),
          //                     ),
          //                   ),
          //                   children: [
          //                     Text(
          //                       //data[index]['NumberOfChicken'],
          //                       'NumberOfChicken : 34',
          //                       style: TextStyle(fontSize: 15),
          //                     ),
          //                     Text(
          //                       'NumberOfDead : 22',
          //                       //data[index]['Numberdead'],
          //                       //"${data.NumberDead}",
          //                       style: TextStyle(fontSize: 15),
          //                     ),
          //                     Text(
          //                       'AverageWeight : 100',
          //                       //data[index]['AverageWeight'],
          //                       // "${user.AverageWeight}",
          //                       style: TextStyle(fontSize: 15),
          //                     ),
          //                   ],
          //                   //dense: true,
          //                   //tileColor: Colors.orangeAccent,
          //                   // shape: RoundedRectangleBorder(
          //                   //borderRadius: BorderRadius.circular(10.0)),
          //                   // selected: true,
          //                   //selectedTileColor: Colors.grey[350],
          //                   //minLeadingWidth: 10,
          //                   //onTap: () {
          //                   // Navigator.push(
          //                   //     context,
          //                   //     MaterialPageRoute(
          //                   //         builder: (context) => FarmMaster()));
          //                 ),
          //               );
          //             });
          //       } else
          //         return Center(
          //           child: Text('Undefined State'),
          //         );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        date1 = selectedDate.toString();
        DateInputController.text = DateFormat.yMMMd().format(selectedDate);
      });
  }
}

