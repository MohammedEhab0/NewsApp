import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/cubit/SourceState.dart';
import 'package:news/api/api_manager/api_manager.dart';

import '../../News/Cubit/CubitNewsViewModel.dart';

class CubitSourceViewModel extends Cubit<SourceState> {


  CubitSourceViewModel() : super(SourceLoadingState());
  CubitNewsViewModel viewModel = CubitNewsViewModel();
  getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
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
