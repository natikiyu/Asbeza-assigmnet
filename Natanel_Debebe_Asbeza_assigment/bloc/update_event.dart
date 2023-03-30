part of 'update_bloc.dart';

abstract class UpdateEvent {
  const UpdateEvent();
}

class GetDataButtonPressed extends UpdateEvent {

  @override
  List<Object> get props => [];
}


class HistoryEvent extends UpdateEvent {
  final Item item;
  const HistoryEvent({required this.item});

  @override
  List<Object> get props => [];

  get data => item;
}