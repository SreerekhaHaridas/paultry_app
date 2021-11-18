// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paultry_app/BLOCs/branch/cubit/branch_cubit.dart';

import 'form_menu.dart';

class SelectBranch extends StatefulWidget {
  @override
  _SelectBranchState createState() => _SelectBranchState();
}

class _SelectBranchState extends State<SelectBranch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Farms',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: BlocBuilder<BranchCubit, BranchState>(
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
                    child: ListTile(
                      title: Center(
                        child: Text(
                          data[index]['_source']['FarmName'] ?? 'NO TAG',
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
                      minLeadingWidth: 10,
                      onTap: () {
                        Box box = Hive.box('Farm');
                        box.put('FarmID', data[index]['_id']);
                        box.put('FarmName', data[index]['_source']['FarmName']);
                        box.put('BatchID',
                            data[index]['_source']['currentBatchId']);
                          print('tap');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormMenu()));
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
    );
  }
}
