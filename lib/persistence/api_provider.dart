import 'package:http/http.dart' as http;
import 'package:bloc_architect/models/main_model.dart';
import 'package:bloc_architect/persistence/api_service.dart';

class ApiProvider extends ApiService {
  final _baseUrl =
      "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";
  @override
  Future<MainModel?> getList() async {
    try {
      var uri = Uri.parse(_baseUrl);
      var response = await http.get(uri);
      if (response.statusCode != 200) {
        throw new Exception('error getting data');
      }
      var list = mainModelFromJson(response.body);
      return list;
    } catch (e) {
      return null;
    }
  }
}
