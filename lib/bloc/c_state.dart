part of 'c_bloc.dart';

@immutable
abstract class CState extends Equatable{
 const CState();

 @override
 List<Object?> get props => [];
}

class CInitial extends CState {}

class CLoading extends CState{}

class CLoaded extends CState{
  final CovidModel covidModel;
  const CLoaded(this.covidModel);
}

class CError extends CState{
  final String? message;
  const CError(this.message);
}
