import 'package:flutter/material.dart';

import 'package:news/Modal/SourceResponse.dart';
import 'package:news/UI/HomeScreen/News/NewsDetails.dart';
import 'package:news/UI/HomeScreen/News/NewsItem.dart';
import 'package:news/api/api_manager/api_manager.dart';
import '../../../Utils/AppColors.dart';
import '../../../Utils/AppStyle.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          /// if it loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.darkGray,
            ));
            // error clint : can not conecct to server
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(
                  'something went ronge ',
                  style: AppStyle.medium20primaryDark,
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                      ;
                      setState(() {});
                    },
                    child: Text(
                      'try again ',
                      style: AppStyle.medium20primaryDark,
                    ))
              ],
            );
          }
          // error server : response error
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(
                  snapshot.data!.message!,
                  style: AppStyle.medium20primaryDark,
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: Text(
                      'try again ',
                      style: AppStyle.medium20primaryDark,
                    ))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {}, child: NewsItem(news: newsList[index]));
            },
          );
        });
  }
}
