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

// @override
// Stream<CatelogState> mapEventToState(CatelogEvent event) async* {
//   if (event is EventLoading) {
//     yield CatelogLoading();
//   } else if (event is EventLoaded) {
//     try {
//       MainModel? data = await repository!.getData();
//       yield Catelogloaded(data!);
//     } catch (_) {
//       yield CatelogError();
//     }
//   } else {
//     yield CatelogError();
//   }
// }

@override
Stream<CatelogState> _mapCatLogStartedToState() async* {}
