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



class langprovider extends ChangeNotifier{
  bool hindi = false;
  bool eng = true;
  bool guj = false;
  bool isdark = false;
  void boolforbool(String lang){
    if(lang == "hindi")
    {
      print("hindi");
      hindi = !hindi;
      boolgetter(lang);
      print("${this.hindi}");
      notifyListeners();
    }
    else if(lang == "eng")
    {
      print("eng");
      eng = !eng;
      boolgetter(lang);
      print("${this.eng}");
      notifyListeners();
    }
    else if (lang == "guj")
    {
      print("guj");
      guj = !guj;
      boolgetter(lang);
      print("${this.guj}");
      notifyListeners();
    }
    else if (lang == "Theme")
    {
      isdark = !isdark;
      notifyListeners();
    }
    notifyListeners();
  }
  void boolgetter(String lang){
    if(lang == "hindi")
    {

      eng = false;
      guj = false;

      notifyListeners();
    }
    else if(lang == "eng")
    {
      hindi = false;
      guj = false;
      notifyListeners();
    }
    else if (lang == "guj")
    {
      eng = false;
      hindi = false;
      notifyListeners();
    }
    notifyListeners();

  }
  notifyListeners();
}