import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Modal/Category.dart';
import 'package:news/Modal/SourceResponse.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/SourceTapWidget.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/SourceViewModel.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/cubit/CubitSourceViewModel.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/cubit/SourceState.dart';
import 'package:news/Utils/AppColors.dart';
import 'package:news/Utils/AppStyle.dart';
import 'package:news/api/api_manager/api_manager.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({required this.category});

  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getSources(widget.category.id);
    super.initState();
  }

  // SourceViewModel viewModel = SourceViewModel();
  CubitSourceViewModel viewModel = CubitSourceViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitSourceViewModel, SourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.darkGray,
            ));
          }
          if (state is SourceErrorState) {
            return Column(
              children: [
                Text(
                  state.errorMessage,
                  style: AppStyle.medium20primaryDark,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text(
                      'try again ',
                      style: AppStyle.medium20primaryDark,
                    ))
              ],
            );
          } else if (state is SourceSuccessState) {
            return SourceTapWidget(
              sources: state.sourceList, categoryId: widget.category.id,
            );
          }
          return Container(); // unreachable
        });
    // ChangeNotifierProvider(
    //     create: (context) => viewModel,
    //     child: Consumer<SourceViewModel>(
    //       builder: (context, viewModel, child) {
    //         if (viewModel.sourceList == null) {
    //           return Center(
    //               child: CircularProgressIndicator(
    //             color: AppColors.darkGray,
    //           ));
    //         } else if (viewModel.errorMessage != null) {
    //           return Column(
    //             children: [
    //               Text(
    //                 viewModel.errorMessage!,
    //                 style: AppStyle.medium20primaryDark,
    //               ),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     viewModel.getSources(widget.category.id);
    //                     setState(() {});
    //                   },
    //                   child: Text(
    //                     'try again ',
    //                     style: AppStyle.medium20primaryDark,
    //                   ))
    //             ],
    //           );
    //         } else {
    //           return SourceTapWidget(
    //             sources: viewModel.sourceList!,
    //           );
    //         }
    //       },
    //     )
    //     // FutureBuilder<SourceResponse?>(
    //     //     future: ApiManager.getSources(widget.category.id),
    //     //     builder: (context, snapshot) {
    //     //       /// if it loading
    //     //       if (snapshot.connectionState == ConnectionState.waiting) {
    //     //         return Center(
    //     //             child: CircularProgressIndicator(
    //     //           color: AppColors.darkGray,
    //     //         ));
    //     //         // error clint : can not conecct to server
    //     //       } else if (snapshot.hasError) {
    //     //         return Column(
    //     //           children: [
    //     //             Text(
    //     //               'something went ronge ',
    //     //               style: AppStyle.medium20primaryDark,
    //     //             ),
    //     //             ElevatedButton(
    //     //                 onPressed: () {
    //     //                   ApiManager.getSources(widget.category.id);
    //     //                   setState(() {});
    //     //                 },
    //     //                 child: Text(
    //     //                   'try again ',
    //     //                   style: AppStyle.medium20primaryDark,
    //     //                 ))
    //     //           ],
    //     //         );
    //     //       }
    //     //       // error server : response error
    //     //       if (snapshot.data?.status != 'ok') {
    //     //         return Column(
    //     //           children: [
    //     //             Text(
    //     //               snapshot.data!.message!,
    //     //               style: AppStyle.medium20primaryDark,
    //     //             ),
    //     //             ElevatedButton(
    //     //                 onPressed: () {
    //     //                   ApiManager.getSources(widget.category.id);
    //     //                   setState(() {});
    //     //                 },
    //     //                 child: Text(
    //     //                   'try again ',
    //     //                   style: AppStyle.medium20primaryDark,
    //     //                 ))
    //     //           ],
    //     //         );
    //     //       }
    //     //       var sourceList = snapshot.data!.sources ?? [];
    //     //       return SourceTapWidget(
    //     //         sources: sourceList,
    //     //       );
    //     //     }),
    //     );
  }
}
