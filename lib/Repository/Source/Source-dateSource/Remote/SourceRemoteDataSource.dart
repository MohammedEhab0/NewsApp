import '../../../../Modal/SourceResponse.dart';

abstract class SourceRemoteDataSource{
  Future<SourceResponse?> getSources(String categoryId);
}