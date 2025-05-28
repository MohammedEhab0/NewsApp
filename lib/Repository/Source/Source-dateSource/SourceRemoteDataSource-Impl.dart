import 'package:news/Modal/SourceResponse.dart';
import 'package:news/Repository/Source/Source-dateSource/SourceRemoteDataSource.dart';
import 'package:news/api/api_manager/api_manager.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    var response =await apiManager.getSources(categoryId);
    return response;

  }
}