// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paultry_app/BLOCs/chicktransfer/cubit/chicktransferlist_cubit.dart';
import 'package:paultry_app/forms/transaction_forms/chick_transferEditor.dart';
import 'package:paultry_app/utils/common_ui.dart';
import 'package:paultry_app/utils/datefilter.dart';

class ChickTransferList extends StatefulWidget {
  const ChickTransferList({Key? key}) : super(key: key);

  @override
  _ChickTransferListState createState() => _ChickTransferListState();
}

class _ChickTransferListState extends State<ChickTransferList> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  TextEditingController farmidInputcontroller = new TextEditingController();
  TextEditingController farmnameInputcontroller = new TextEditingController();
  late Box box;
  void initState() {
    super.initState();
    box = Hive.box('Farm');
    setState(() {});
  }

  // _addInfo() {
  //   // FarmDataModel farmdata = FarmDataModel(
  //   //   farmname: farmnameInputcontroller.text,
  //   // );
  //   // box.add(farmdata);
  //   // print('Info added to box!');
  //   box.put('FarmName', data[index]['_source']['FarmName']);
  //   box.put('FarmID', data[index]['_id']);
  //   print('Info Added');
  // }

  _getInfo() {
    var FarmName = box.get('FarmName');
    var FarmId = box.get('FarmId');
    print('Info retrieved from box: $FarmName ($FarmId)');
    print('Info retrieved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Chick Transfer List"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getInfo();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChickTransfer()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // BackgroundChick(),
            SizedBox(
              height: 10,
            ),
            Flexible(
                flex: 3,
                child: DateFilter(
                  datesSelected: (fromDate1, toDate1) {
                    fromDate = fromDate1;
                    toDate = toDate1;
                    BlocProvider.of<ChicktransferlistCubit>(context)
                        .fetchData(fromDate, toDate);
                  },
                  fromDate: fromDate,
                  toDate: toDate,
                )),
            Flexible(
              flex: 25,
              child:
                  BlocBuilder<ChicktransferlistCubit, ChicktransferlistState>(
                builder: (context, state) {
                  if (state is Fetching) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FetchError) {
                    return Center(
                      child: Text(state.msg),
                    );
                  } else if (state is FetchCompleted) {
                    final List data = state.data;
                    return ListView.builder(
                        padding: EdgeInsets.only(top: 15),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shape: cardstyle,
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  data[index]['_source']['FarmName'] ??
                                      'NO TAG',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 0.0),
                              dense: true,
                              //tileColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              selected: true,
                              selectedTileColor: Colors.white,
                              onTap: () {
                                print('tap');
                                // _addInfo();
                                box.put('FarmName', data[index]['_source']['FarmName']);
                                box.put('FarmID', data[index]['_id']);
                                print('Info Added');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChickTransfer()));
                              },
                            ),
                          );
                        });
                  } else
                    return Center(
                      child: Text('Undefined State'),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  // showAlertDialog(BuildContext context) {
  //   // final void Function(DateTime fromDate, DateTime toDate) datesSelected;
  //   // set up the button
  //   Widget okButton = FlatButton(
  //       child: Icon(Icons.send),
  //     onPressed: () {
  //         Navigator.pop(context);
  //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChickTransferList()));
  //         // widget.datesSelected(widget.fromDate, widget.toDate);
  //          },
  //   );
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Select Date"),
  //     content: DateFilter(
  //       datesSelected: (fromDate1, toDate1) {
  //         fromDate = fromDate1;
  //         toDate = toDate1;
  //         BlocProvider.of<ChicktransferlistCubit>(context)
  //             .fetchData(fromDate, toDate);
  //       },
  //       fromDate: fromDate,
  //       toDate: toDate,
  //     ),
  //     // Text("This is my message."),
  //     actions: [
  //       okButton,
  //     ],
  //   );
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
