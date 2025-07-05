import '../../../../Modal/SourceResponse.dart';
abstract class SourceOfflineDataSource{
  Future<SourceResponse?> getSources(String categoryId);
  void SaveSourceResponse(SourceResponse? sourceResponse);
}