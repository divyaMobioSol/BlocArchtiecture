import 'package:bloc_architect/bloc/catlog_event.dart';
import 'package:bloc_architect/bloc/catlog_state.dart';
import 'package:bloc_architect/persistence/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/main_model.dart';

class CatLogBloc extends Bloc<CatelogEvent, CatelogState> {
  Repository? repository;

  Future<void> ondata(EventLoaded event, Emitter<CatelogState?> emit) async {
    MainModel? data = await repository!.getData();
    emit(Catelogloaded(data));
  }

  CatLogBloc(this.repository) : super(CatelogLoading()) {
    // MainModel? data = await repository!.getData();
    on<EventLoading>((event, emit) => emit(CatelogLoading()));
    on<EventLoaded>(ondata);
    on<EventError>((event, emit) => emit(CatelogError()));
  }
}

@override
Stream<CatelogState> _mapCatLogStartedToState() async* {}
