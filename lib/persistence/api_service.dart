import 'package:bloc_architect/models/main_model.dart';

abstract class ApiService {
  Future<MainModel?> getList();
}
