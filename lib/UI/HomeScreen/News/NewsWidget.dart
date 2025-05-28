import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Dip/Dip.dart';
import 'package:news/Modal/SourceResponse.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/cubit/SourceState.dart';
import 'package:news/UI/HomeScreen/News/Cubit/CubitNewsViewModel.dart';
import 'package:news/UI/HomeScreen/News/Cubit/NewsStates.dart';
import 'package:news/UI/HomeScreen/News/NewsDetails.dart';
import 'package:news/UI/HomeScreen/News/NewsItem.dart';
import 'package:news/UI/HomeScreen/News/NewsViewModel.dart';
import 'package:news/api/api_manager/api_manager.dart';
import 'package:provider/provider.dart';

import '../../../Utils/AppColors.dart';
import '../../../Utils/AppStyle.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final ScrollController scrollController = ScrollController();
  CubitNewsViewModel viewModel = CubitNewsViewModel(newsRepository: injectNewsRepository());

  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.source.id!, viewModel.selectedPageNumber);
    scrollController.addListener(onScroll);
  }

  @override
  void didUpdateWidget(NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the source has changed
    if (oldWidget.source.id != widget.source.id) {
      // Call getNews with the new source id
      viewModel.getNews(widget.source.id!, viewModel.selectedPageNumber);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      viewModel.updateNews(widget.source.id!, viewModel.selectedPageNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitNewsViewModel, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.darkGray,
            ),
          );
        }
        if (state is NewsErrorState) {
          return Column(
            children: [
              Text(
                state.errorMessage,
                style: AppStyle.medium20primaryDark,
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.getNews(widget.source.id!, viewModel.selectedPageNumber);
                },
                child: Text(
                  'Try Again',
                  style: AppStyle.medium20primaryDark,
                ),
              ),
            ],
          );
        } else if (state is NewsSuccessState) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: viewModel.newsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, NewsDetails.routeName,
                            arguments: viewModel.newsList[index]);
                      },
                      child: NewsItem(news: viewModel.newsList[index]),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container(); // unreachable
      },
    );
  }
}
    // ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<NewsViewModel>(builder: (context, viewModel, child) {
    //     if (viewModel.errorMessage != null) {
    //       return Column(
    //         children: [
    //           Text(
    //             viewModel.errorMessage!,
    //             style: AppStyle.medium20primaryDark,
    //           ),
    //           ElevatedButton(
    //               onPressed: () {
    //                 viewModel.getNews(widget.source.id!);
    //                 ;
    //                 setState(() {});
    //               },
    //               child: Text(
    //                 'try again ',
    //                 style: AppStyle.medium20primaryDark,
    //               ))
    //         ],
    //       );
    //     } else if (viewModel.newsList == null) {
    //       return Center(
    //           child: CircularProgressIndicator(
    //         color: AppColors.darkGray,
    //       ));
    //     } else {
    //       return ListView.builder(
    //         itemCount: viewModel.newsList!.length,
    //         itemBuilder: (context, index) {
    //           return InkWell(
    //               onTap: () {
    //                 Navigator.pushNamed(context, NewsDetails.routeName,
    //                     arguments: viewModel.newsList![index]);
    //               },
    //               child: NewsItem(news: viewModel.newsList![index]));
    //         },
    //       );
    //     }
    //   }
    //
    //       // FutureBuilder(
    //       //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //       //     builder: (context, snapshot) {
    //       //       /// if it loading
    //       //       if (snapshot.connectionState == ConnectionState.waiting) {
    //       //         return Center(
    //       //             child: CircularProgressIndicator(
    //       //           color: AppColors.darkGray,
    //       //         ));
    //       //         // error clint : can not conecct to server
    //       //       } else if (snapshot.hasError) {
    //       //         return Column(
    //       //           children: [
    //       //             Text(
    //       //               'something went ronge ',
    //       //               style: AppStyle.medium20primaryDark,
    //       //             ),
    //       //             ElevatedButton(
    //       //                 onPressed: () {
    //       //                   ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //       //                   ;
    //       //                   setState(() {});
    //       //                 },
    //       //                 child: Text(
    //       //                   'try again ',
    //       //                   style: AppStyle.medium20primaryDark,
    //       //                 ))
    //       //           ],
    //       //         );
    //       //       }
    //       //       // error server : response error
    //       //       if (snapshot.data?.status != 'ok') {
    //       //         return Column(
    //       //           children: [
    //       //             Text(
    //       //               snapshot.data!.message!,
    //       //               style: AppStyle.medium20primaryDark,
    //       //             ),
    //       //             ElevatedButton(
    //       //                 onPressed: () {
    //       //                   ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //       //                   setState(() {});
    //       //                 },
    //       //                 child: Text(
    //       //                   'try again ',
    //       //                   style: AppStyle.medium20primaryDark,
    //       //                 ))
    //       //           ],
    //       //         );
    //       //       }
    //       //       var newsList = snapshot.data?.articles ?? [];
    //       //       return ListView.builder(
    //       //         itemCount: newsList.length,
    //       //         itemBuilder: (context, index) {
    //       //           return InkWell(
    //       //               onTap: () {
    //       //                 Navigator.pushNamed(context, NewsDetails.routeName,
    //       //                     arguments: newsList[index]);
    //       //               },
    //       //               child: NewsItem(news: newsList[index]));
    //       //         },
    //       //       );
    //       //     }),
    //       ));

