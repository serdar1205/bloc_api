import 'dart:async';
import 'package:bloc_api/data/model/data.dart';
import 'package:bloc_api/resources/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'c_event.dart';
part 'c_state.dart';

class CBloc extends Bloc<CEvent, CState> {
  CBloc() : super(CInitial()) {

    final ApiRepository _apiRepository = ApiRepository();

    on<GetCList>((event, emit) async{
      try{
        emit(CLoading());
        final mList = await _apiRepository.fetchDataList();
        emit(CLoaded(mList));
        if(mList.error != null){
          emit(CError(mList.error));
        }
      }on NetworkError{
        emit(CError('message error'));
      }
    });
  }
}
