import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Info{
  late final Box box;
    _addInfo() async {
      box.put('FarmName',' ');

  }

  _getInfo() {
    var Farmname = box.get('Farmname');
    var FarmId = box.get('FarmID');
    print('Info retrieved from box: $Farmname ($FarmId)');
  }

  _updateInfo() {
    // Update info of people box
  }

  _deleteInfo() {
    // Delete info from people box
  }


}


