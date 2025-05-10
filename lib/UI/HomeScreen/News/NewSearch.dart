import 'package:flutter/material.dart';
import 'package:news/UI/HomeScreen/News/NewsDetails.dart';
import 'package:news/UI/HomeScreen/News/NewsItem.dart';
import 'package:news/api/api_manager/api_manager.dart';

import '../../../Utils/AppColors.dart';
import '../../../Utils/AppStyle.dart';

class NewSearch extends StatefulWidget {
  NewSearch({required this.SearchString});

  String SearchString;

  @override
  State<NewSearch> createState() => _NewSearchState();
}

class _NewSearchState extends State<NewSearch> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSearchNews(widget.SearchString ?? ''),
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
                      ApiManager.getSearchNews(widget.SearchString ?? '');
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
                      ApiManager.getSearchNews(widget.SearchString ?? '');
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
                  onTap: () {
                    Navigator.pushNamed(context, NewsDetails.routeName,
                        arguments: newsList[index]);
                  },
                  child: NewsItem(news: newsList[index]));
            },
          );
        });
  }
}
