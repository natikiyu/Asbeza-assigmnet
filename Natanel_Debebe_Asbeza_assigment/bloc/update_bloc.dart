import 'dart:async';

import 'package:asbeza/bloc/update_state.dart';
import 'package:bloc/bloc.dart';
import 'package:asbeza/model/item.dart';

import '../model/item.dart';
import '../services/apiService.dart';

part 'update_event.dart';
//part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  List history = [];
  UpdateBloc() : super(UpdateInitial()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(UpdateLoadingState());
      final item = await item_api().fetchActivity();
      emit(UpdateSuccessState(item!,history));
    });
    on<HistoryEvent>((event, emit) => {history.add(event.data)});
  }
}
