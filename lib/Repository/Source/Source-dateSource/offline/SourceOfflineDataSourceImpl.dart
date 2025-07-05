import 'package:news/Modal/SourceResponse.dart';
import 'package:news/Repository/Source/Source-dateSource/offline/SourceOfflineDataSource.dart';

class SourceOfflineDataSourceImpl implements SourceOfflineDataSource{
  @override
  void SaveSourceResponse(SourceResponse? sourceResponse) {
    // TODO: implement SaveSourceResponse
  }

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}