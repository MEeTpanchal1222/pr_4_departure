class modal {
  int index;
  Dohe? dohe;
   modal({required this.index,required this.dohe});
   factory modal.fromJson(Map json){
     return modal(index: json['index'], dohe: json['dohas']!= null?Dohe.fromJson(json['dohas']):null,);

   }
}

class Dohe {
  String original,gujarati,hindi,english;
  Dohe({required this.original,required this.gujarati,required this.hindi,required this.english});
  factory Dohe.fromJson(Map json){
    return Dohe(original: json['original'], gujarati: json['gujarati'], hindi: json['hindi'], english: json['english']);
  }
}