import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Repository/Source/Source-Repository/SourceRepository-Impl.dart';
import 'package:news/Repository/Source/Source-dateSource/Remote/SourceRemoteDataSource-Impl.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/cubit/SourceState.dart';
import 'package:news/api/api_manager/api_manager.dart';

import '../../../../Repository/Source/Source-Repository/SourceRepository.dart';
import '../../../../Repository/Source/Source-dateSource/Remote/SourceRemoteDataSource.dart';
import '../../News/Cubit/CubitNewsViewModel.dart';

class CubitSourceViewModel extends Cubit<SourceState> {
 SourceRepository sourceRepository;

  CubitSourceViewModel({required this.sourceRepository}) : super(SourceLoadingState()){


  }
  getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      } else if (response?.status == 'ok') {
        emit(SourceSuccessState(sourceList: response!.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }

}
