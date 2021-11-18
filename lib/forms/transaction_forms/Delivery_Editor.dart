// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, non_constant_identifier_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';
import 'package:paultry_app/datamodels/transaction/delivery.dart';
import 'package:paultry_app/experiments/backgroundchick.dart';
import 'package:paultry_app/utils/common_ui.dart';
import 'package:paultry_app/utils/validate.dart';

class Delivery extends StatefulWidget {
  late String SalesOrderId;
  late num SalesOrderQuantity;
  late num ActualWeight;
  late num DiscountWeight;
  late num NetWeight;
  late String CustomerLedger;
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  DeliveryDataModel delvery = DeliveryDataModel.empty();
  TextEditingController orderidInputcontroller = new TextEditingController();
  TextEditingController orderQtyInputcontroller = new TextEditingController();
  TextEditingController actualweightInputcontroller =
      new TextEditingController();
  TextEditingController discountweightInputcontroller =
      new TextEditingController();
  TextEditingController netweightInputcontroller = new TextEditingController();
  TextEditingController ledgerInputcontroller = new TextEditingController();
  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Delivery Editor'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SafeArea(
        // child: Container(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Form(
              key: _FormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(height: height * .2),
                    SizedBox(height: 50),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          delvery.SalesOrderId = value!;
                        },
                        controller: orderidInputcontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Sales order ID',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.confirmation_num_outlined,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          delvery.SalesOrderQuantity = value! as num;
                        },
                        controller: orderQtyInputcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Sales order Quantity',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.production_quantity_limits,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          delvery.ActualWeight = value! as num;
                        },
                        controller: actualweightInputcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Actual Weight',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.monitor_weight,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          delvery.DiscountWeight = value! as num;
                        },
                        controller: discountweightInputcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Discount Weight',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.monitor_weight,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          delvery.NetWeight = value! as num;
                        },
                        controller: netweightInputcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Net Weight',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.monitor_weight,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          delvery.CustomerLedger = value!;
                        },
                        controller: ledgerInputcontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Customer Ledger',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.note_add,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.lightGreen,
        onPressed: () async {
          if (_FormKey.currentState!.validate()) {}
          delvery.SalesOrderId = orderidInputcontroller.text;
          delvery.SalesOrderQuantity =
              double.parse(orderQtyInputcontroller.text);
          delvery.ActualWeight = double.parse(actualweightInputcontroller.text);
          delvery.DiscountWeight =
              double.parse(discountweightInputcontroller.text);
          delvery.NetWeight = double.parse(netweightInputcontroller.text);
          delvery.CustomerLedger = ledgerInputcontroller.text;
          print('Data : ${delvery.toJson()}');
          await web.deliveryRecord(model: delvery);
        },
        child: Icon(Icons.check_outlined),
        backgroundColor: Colors.lightGreen.shade900,
      ),
    );
  }
}
