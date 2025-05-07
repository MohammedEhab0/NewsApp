import 'package:flutter/material.dart';
import 'package:news/Modal/Category.dart';
import 'package:news/Modal/SourceResponse.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/SourceTapWidget.dart';
import 'package:news/Utils/AppColors.dart';
import 'package:news/Utils/AppStyle.dart';
import 'package:news/api/api_manager/api_manager.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({required this.category});

  Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
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
                      ApiManager.getSources(widget.category.id);
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
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text(
                      'try again ',
                      style: AppStyle.medium20primaryDark,
                    ))
              ],
            );
          }
          var sourceList = snapshot.data!.sources ?? [];
          return SourceTapWidget(
            sources: sourceList,
          );
        });
  }
}
