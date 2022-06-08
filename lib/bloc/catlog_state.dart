import 'package:bloc_architect/models/main_model.dart';

abstract class CatelogState {}

class CatelogLoading extends CatelogState {}

class Catelogloaded extends CatelogState {
  MainModel? mainModel;
  List<String>? data;

  Catelogloaded(this.mainModel);
}

class CatelogError extends CatelogState {}
