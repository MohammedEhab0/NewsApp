import 'package:news/Modal/SourceResponse.dart';
import 'package:news/Repository/Source/Source-dateSource/SourceRemoteDataSource.dart';

import 'SourceRepository.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    // TODO: implement getSources
   return remoteDataSource.getSources(categoryId);
  }

}