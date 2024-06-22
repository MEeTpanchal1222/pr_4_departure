import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pr_4_departure/modal/main_modal.dart';


class Dataprovider extends ChangeNotifier{
  List datalist =[];
  List<modal> userlist =[];
  Dataprovider(){
    print('_____________________________________________________________________');
    Tojson();
    print('_____________________________________________________________________');
    notifyListeners();
  }
  Future<void> Tojson()async {
    String? json  = await rootBundle.loadString('assets/data.json');
    datalist =jsonDecode(json);
    userlist = datalist.map((e) => modal.fromJson(e),).toList();
    print(userlist);
    notifyListeners();

  }
}