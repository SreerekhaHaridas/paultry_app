// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paultry_app/BLOCs/hatcherymaster/cubit/hatcherymasterlist_cubit.dart';
import 'package:paultry_app/forms/master_forms/Hatchery_Master_Editor.dart';

class MasterHatcheryWidget extends StatefulWidget {
  const MasterHatcheryWidget({Key? key}) : super(key: key);

  @override
  _MasterHatcheryWidgetState createState() => _MasterHatcheryWidgetState();
}

class _MasterHatcheryWidgetState extends State<MasterHatcheryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hatchery List"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HatcheryMaster()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: BlocBuilder<HatcherymasterlistCubit, HatcherymasterlistState>(
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
                          data[index]['_source']['name'] ?? 'NO TAG',
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HatcheryMaster()));
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
