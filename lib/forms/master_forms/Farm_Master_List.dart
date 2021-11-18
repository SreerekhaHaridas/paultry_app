// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paultry_app/BLOCs/farmsmaster/cubit/farmlist_cubit.dart';
import 'package:paultry_app/forms/master_forms/Farm_Master_Editor.dart';
import 'FarmSearch.dart';

class farmListWidget extends StatefulWidget {
  const farmListWidget({Key? key}) : super(key: key);

  @override
  _farmListWidgetState createState() => _farmListWidgetState();
}

class _farmListWidgetState extends State<farmListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farms List"),
        backgroundColor: Colors.lightGreen.shade900,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FarmMaster()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: BlocBuilder<FarmlistCubit, FarmlistState>(
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
                          ),
                        ),
                      ),
                      dense: true,
                      //tileColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      selected: true,
                      selectedTileColor: Colors.white,
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FarmMaster()));
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
