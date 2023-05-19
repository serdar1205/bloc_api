import 'package:dio/dio.dart';

import '../data/model/data.dart';

class ApiProvider{
  final Dio _dio = Dio();
  final String _url = 'assets/json/data.json';

  Future<CovidModel> fetchDataList()async{
    try{
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    }catch(error,stacktrace){
      print('Exception occured: $error stacktrace $stacktrace');
      return CovidModel.withError('Data not found / connection issue');
    }
  }



}