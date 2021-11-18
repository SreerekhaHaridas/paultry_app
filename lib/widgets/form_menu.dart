// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paultry_app/BLOCs/chicktransfer/cubit/chicktransferlist_cubit.dart';
import 'package:paultry_app/BLOCs/dailyentry/cubit/dailyentrylist_cubit.dart';
import 'package:paultry_app/BLOCs/delivery/cubit/deliverylist_cubit.dart';
import 'package:paultry_app/BLOCs/farmsmaster/cubit/farmlist_cubit.dart';
import 'package:paultry_app/BLOCs/hatcherymaster/cubit/hatcherymasterlist_cubit.dart';
import 'package:paultry_app/BLOCs/hatcherytransaction/cubit/hatcherytransactionlist_cubit.dart';
import 'package:paultry_app/BLOCs/pickup/cubit/pickuplist_cubit.dart';
import 'package:paultry_app/forms/master_forms/Farm_Master_List.dart';
import 'package:paultry_app/forms/master_forms/Hatchery_Master_List.dart';
import 'package:paultry_app/forms/transaction_forms/Delivery_List.dart';
import 'package:paultry_app/forms/transaction_forms/Hatchery_Transaction_List.dart';
import 'package:paultry_app/forms/transaction_forms/Pickup_Transaction_List.dart';
import 'package:paultry_app/forms/transaction_forms/Report.dart';
import 'package:paultry_app/forms/transaction_forms/chicktransferList.dart';
import 'package:paultry_app/forms/transaction_forms/dailyEntryList.dart';
import 'package:paultry_app/utils/common_ui.dart';

class FormMenu extends StatefulWidget {

  @override
  _FormMenuState createState() => _FormMenuState();
}

class _FormMenuState extends State<FormMenu> {
  final List _list = [
    'FARMS\n(Master)',
    'HATCHERY\n(Master)',
    'CHICK TRANSFER\n(Transaction)',
    'DELIVERY\n(Transaction)',
    'HATCHERY\n(Transaction)',
    'DAILY ENTRY\n(Transaction)',
    'PICK UP\n(Transaction)',
    'VIEW REPORT',
  ];
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Poultry Farm'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: GestureDetector(
                onTap: () {
                  routing(index);
                },
                child: Center(
                  child: Text(
                    _list[index],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  routing(int index) {
    if (index == 0)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => FarmlistCubit(url: '')..fetchData(),
                child: farmListWidget(),
              )));
    else if (index == 1)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) =>
                HatcherymasterlistCubit(url: '')..fetchData(),
                child: MasterHatcheryWidget(),
              )));
    else if (index == 2)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ChicktransferlistCubit(url: '')
                  ..fetchData(DateTime.now(), DateTime.now()),
                child: ChickTransferList(),
              )));
    else if (index == 3)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => DeliverylistCubit(url: '')
                  ..fetchData(DateTime.now(), DateTime.now()),
                child: DeliveryListWidget(),
              )));
    else if (index == 4)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => HatcherytransactionlistCubit(url: '')
                  ..fetchData(DateTime.now(), DateTime.now()),
                child: HatcheryTransactionList(),
              )));
    else if (index == 5)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => DailyentrylistCubit(url: '')
                  ..fetchData(DateTime.now(), DateTime.now()),
                child: DailyEntryWidget(),
              )));
    else if (index == 6)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => PickuplistCubit(url: '')
                  ..fetchData(DateTime.now(), DateTime.now()),
                child: PickupListWidget(),
              )));
    else if (index == 7)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => View_Report()));
  }
}
