import 'api_provider.dart';
import '../data/model/data.dart';

class ApiRepository{
  final _provider = ApiProvider();


  Future<CovidModel> fetchDataList(){
    return _provider.fetchDataList();
  }

}
class NetworkError extends Error{}