import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:alquran_alkarim/models/quranresponse.dart';
import 'package:alquran_alkarim/models/pageresponse.dart';

class QuranApi {

  Future<List> fetch_names_of_surahs (String url) async
  {
    http.Response response = await http.get(url);
    String data =response.body;
    var jsondata =jsonDecode(data);
    Quran editionresonce=Quran.fromJson(jsondata);
    List surahs =editionresonce.data.surahs;
    return surahs;
  }

  Future putdata(data,Box box) async {
    data.then((values) {
      for (var i in values) box.add(i);
    });
    //  print(box.get('name'));
  }



  Future <Map<String, dynamic>> fetchdata(int index) async {
    try {
      http.Response response = await http.get('http://api.alquran.cloud/v1/quran/ar.alafasy');
      //String data =response.body;
      //var jsondata =jsonDecode(data);
      //quranresponse editionresonce=quranresponse.fromJson(jsondata);
      Map<String, dynamic> datafromapi = new Map<String, dynamic>.from(json.decode(response.body));

      print(datafromapi['data']['surahs'][index]['name']);
      return datafromapi['data']['surahs'][index];
    } catch(ex){
      print(ex);
    }
  }

  Future <pageresponse> fetchpage(int num) async {
    try {
      http.Response response = await http.get('https://60626c760133350017fd1058.mockapi.io/quran');
      String data =response.body;
      print(data);
      var jsondata =jsonDecode(data).cast<Map<String,dynamic>>();
      List<pageresponse> pages = jsondata.map<pageresponse>((item)=>pageresponse.fromJson(item)).toList();
      for(var page in pages ){
        if (page.number == num)
          {
            return page;
          }
      }
    }
    catch(ex)
    {
      print(ex);
    }
  }

  Future <Map<String, dynamic>> fetchsurah() async {
   
    try {
      http.Response response = await http.get('http://api.alquran.cloud/v1/quran/ar.alafasy');
      Map<String, dynamic> datafromapi = new Map<String, dynamic>.from(json.decode(response.body));

      print(datafromapi['data']['surahs'][0]);
      return datafromapi['data'];
    } catch(ex){
      print(ex);
    }
  }
  Future <Map<String, dynamic>> fethenglishaya (int index) async {
    try {
      http.Response response = await http.get('http://api.alquran.cloud/v1/quran/en.asad');
      Map<String, dynamic> datafromapi = new Map<String, dynamic>.from(json.decode(response.body));
      print(datafromapi['data']['surahs'][0]['name']);
      return datafromapi['data']['surahs'][index];
    } catch(ex){
      print(ex);
    }
  }
}



