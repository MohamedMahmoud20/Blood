import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:bloodbankasmaa/Models/Aricles_News.dart';



class Api_News{
//static String ApiKey = "d752c71e6aea4cd78bced8cd91e41201";
  static Future<List<Artical>> fetchArticales() async {
    List<Artical>asmaa = [];
    var urL = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=health&apiKey=d752c71e6aea4cd78bced8cd91e41201');
    //print(urL);
    var response = await http.get(urL);
    var responsebody = jsonDecode(response.body)["articles"];
    //print(responsebody);
    for (var index in responsebody) {
      Artical x = Artical(title: index["title"],
          description: index["description"],
          url: index["url"],
          urlToImage: index["urlToImage"]);
      asmaa.add(x);
      //print(asmaa);
    }
    return asmaa;
  }


}