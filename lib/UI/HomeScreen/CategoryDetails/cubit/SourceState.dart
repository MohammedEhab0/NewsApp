import '../../../../Modal/SourceResponse.dart';

abstract class SourceState{}
 class SourceLoadingState extends SourceState{}
 class SourceErrorState extends SourceState{
  String errorMessage;
  SourceErrorState({required this.errorMessage});
 }
 class SourceSuccessState extends SourceState{
   List<Source>sourceList;
   SourceSuccessState({required this.sourceList});
 }
 class ChangeSourceSelectedIndex extends SourceState {

 }