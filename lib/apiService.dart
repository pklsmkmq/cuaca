import 'cuaca.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://api.openweathermap.org/data/2.5";
  static const String city = "bogor";
  static const String key = "ec67ce854e55173e9aa9b14e98e3f7cc";

  Future getCuaca() async{
    Uri url = Uri.parse("$baseUrl/weather?q=$city&appid=$key");
    final res = await http.get(url);

    if(res.statusCode == 200){
      print("Berhasil");
      var data = cuacaFromJson(res.body);
      return data;
    }else{
      print("gagal");
      throw Exception("gagal");
    }
  }
}