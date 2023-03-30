import 'dart:developer';

import 'package:asbeza/model/item.dart';
//part of 'update_bloc.dart';
import 'package:asbeza/services/apiService.dart';


abstract class UpdateState {}

class UpdateInitial extends UpdateState {

  @override
  // TODO: implement props
  List<Object> get props => [];
}


class UpdateLoadingState extends UpdateState {

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UpdateSuccessState extends UpdateState {
  final List item;
  final List history;
  UpdateSuccessState(
      this.item,
      this.history,
      );

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UpdateFailState extends UpdateState {
  String message;

  UpdateFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
