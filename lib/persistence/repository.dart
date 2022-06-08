import 'package:bloc_architect/models/mainf.dart';
import 'package:bloc_architect/models/main_model.dart';
import 'package:bloc_architect/persistence/api_provider.dart';

class Repository {
  String name = 'dwddd';
  ApiProvider apiProvider = ApiProvider();

  Future<MainModel?> getData() async {
    return await apiProvider.getList();
  }
}
