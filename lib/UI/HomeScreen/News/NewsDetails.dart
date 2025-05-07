import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Utils/AppColors.dart';

import '../../../Modal/NewsResponse.dart';

class NewsDetails extends StatelessWidget {
  News news;

  NewsDetails({required this.news});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(height * .02),
      padding: EdgeInsets.all(height * .01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).secondaryHeaderColor)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => CircularProgressIndicator(
                color: AppColors.darkGray,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: height * .01,
          ),
          Text(
            news.content ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: height * .01,
          ),
        ],
      ),
    );
  }
}
