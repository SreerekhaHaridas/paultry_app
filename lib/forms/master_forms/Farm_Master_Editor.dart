// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';
import 'package:paultry_app/common_Ui/cliper.dart';
import 'package:paultry_app/datamodels/master/farm.dart';
import 'package:paultry_app/utils/common_ui.dart';
import 'package:paultry_app/utils/validate.dart';

class FarmMaster extends StatefulWidget {
  late String farmname;
  late String location;
  late int capacity;
  late String attenderLedger;
  late String currentBatchId;
  late DateTime currentDate;
  late DateTime pastPickupDate;

  @override
  _FarmMasterState createState() => _FarmMasterState();
}

class _FarmMasterState extends State<FarmMaster> {
  Map<String, String> selectedValueMap = Map();
  DateTime selectedDate = DateTime.now();
  late String date;
  late String date1;
  late String farmname;
  late String location;
  late int capacity;
  late String attenderLedger;
  late String currentBatchId;
  late DateTime currentDate;
  late DateTime pastPickupDate;

  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  void _save() {
    final isValid = _FormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _FormKey.currentState!.save();
  }

  FarmDataModel model = FarmDataModel.empty();
  TextEditingController pastpickcontroller = TextEditingController();
  TextEditingController dateInputcontroller = TextEditingController();
  TextEditingController capacityInputcontroller = TextEditingController();
  TextEditingController farmInputcontroller = TextEditingController();
  TextEditingController locationInputcontroller = TextEditingController();
  TextEditingController ledgerInputcontroller = TextEditingController();
  TextEditingController batchInputcontroller = TextEditingController();

  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Farm'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SingleChildScrollView(

        child: Container(
          child: Stack(
            children: <Widget>[
              // Positioned(
              //   top: -MediaQuery.of(context).size.height * .15,
              //   right: -MediaQuery.of(context).size.width * .4,
              // child: BezierContainer(),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _FormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(height: height * .2),
                        SizedBox(height: 20),
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 155.0),
                            child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 7),
                            padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen.shade900,
                              borderRadius: BorderRadius.circular(00),
                            ),
                            child: Text('Farm Name : abc',
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold),),
                            // child: TextFormField(
                            //   validator: (value) {
                            //     return Validate.txtValidator(value!);
                            //   },
                            //   onSaved: (String? value) {
                            //     model.FarmName = value!;
                            //   },
                            //   keyboardType: TextInputType.text,
                            //   controller: farmInputcontroller,
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //     hintText: 'Farm Name',
                            //     hintStyle: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.black38),
                            //     icon: Icon(
                            //       Icons.drive_file_rename_outline,
                            //       color: Colors.black38,
                            //     ),
                            //   ),
                            // ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
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
                              model.location = value!;
                            },
                            keyboardType: TextInputType.text,
                            controller: locationInputcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Location',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.location_on_sharp,
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
                              model.capacity = value as int;
                            },
                            controller: capacityInputcontroller,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              // ignore: deprecated_member_use
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Capacity',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.reduce_capacity_rounded,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Text('Save',style: TextStyle( color: Colors.white,),
        ),

        splashColor: Colors.lightGreen,
         backgroundColor: Colors.lightGreen.shade900,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20),
        //     side: BorderSide(color: Colors.lightGreen.shade900, width: 2.0)
        // ),
        onPressed: () async {
          if (_FormKey.currentState!.validate()) {}
          model.FarmName = farmInputcontroller.text;
          model.location = locationInputcontroller.text;
          model.capacity = int.parse(capacityInputcontroller.text);
          model.attenderLedger = ledgerInputcontroller.text;
          model.currentBatchId = batchInputcontroller.text;
          model.currentDate = selectedDate;
          model.pastPickupDate = selectedDate;
          print('Data : ${model.toJson()}');
          await web.farmRecord(model: model);
        },
        // shape: BeveledRectangleBorder(
        //     borderRadius: BorderRadius.zero
        // ),
        // child: Icon(Icons.check_outlined),

      ),
    );
  }
}
