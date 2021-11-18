// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paultry_app/BLOCs/delivery/cubit/deliverylist_cubit.dart';

import 'package:paultry_app/forms/transaction_forms/Delivery_Editor.dart';
import 'package:paultry_app/utils/common_ui.dart';

class DeliveryListWidget extends StatefulWidget {
  const DeliveryListWidget({Key? key}) : super(key: key);

  @override
  _DeliveryListWidgetState createState() => _DeliveryListWidgetState();
}

class _DeliveryListWidgetState extends State<DeliveryListWidget> {
  // DateTime fromDate = DateTime.now();
  //DateTime toDate = DateTime.now();
  late Box box;
  void initState() {
    super.initState();
    box = Hive.box('Farm');
    setState(() {});
  }

  _addInfo() {
    box.put('FarmName', 'FarmName');
    box.put('FarmID', 'FarmId');
    print('Info Added');
  }

  _getInfo() {
    var Farmname = box.get('FarmName');
    var FarmId = box.get('FarmId');
    print('Info retrieved from box: $Farmname ($FarmId)');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery List"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getInfo();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Delivery()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          // Flexible(
          // flex: 2,
          // child:DateFilter(datesSelected: (fromDate1, toDate1) {
          //   fromDate=fromDate1;
          //   toDate = toDate1;
          //   BlocProvider.of<DeliverylistCubit>(context).fetchData(fromDate, toDate);
          // },fromDate: fromDate ,toDate: toDate,)),
          Flexible(
            flex: 25,
            child: BlocBuilder<DeliverylistCubit, DeliverylistState>(
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
                          elevation: 10.0,
                          shape: cardstyle,
                          child: ListTile(
                            title: Center(
                              child: Text(
                                data[index]['_source']['SalesOrderId'] ??
                                    'NO TAG',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
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
                              // _addInfo();
                              box.put('FarmName', data[index]['_source']['FarmName']);
                              box.put('FarmID', data[index]['_id']);
                              print('Info Added');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Delivery()));
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
    );
  }

}
