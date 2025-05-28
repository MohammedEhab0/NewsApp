// import 'package:flutter/material.dart';
// import 'package:news/api/api_manager/api_manager.dart';
//
// import '../../../Modal/SourceResponse.dart';
//
// class SourceViewModel extends ChangeNotifier{
//   List<Source>?sourceList;
//   String ? errorMessage ;
//
//   void getSources (String categoryId)async{
//
//     sourceList=null;
//     errorMessage =null;
//     notifyListeners();
//     try{
//       var response= await ApiManager.getSources(categoryId);
//       if(response?.status == 'error'){
//         errorMessage= response!.message;
//
//       }else{
//         sourceList=response!.sources;
//       }
//
//     }catch(e){
//       errorMessage='Error Loading Source List';
//     }
//
//    notifyListeners();
//
//   }
// }