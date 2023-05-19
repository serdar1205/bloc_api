part of 'c_bloc.dart';

@immutable
abstract class CEvent extends Equatable {
 const CEvent();

  @override
  List<Object> get props => [];
}

class GetCList extends CEvent{}
