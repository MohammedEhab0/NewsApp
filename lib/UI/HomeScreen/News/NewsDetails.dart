import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/Utils/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Modal/NewsResponse.dart';

class NewsDetails extends StatefulWidget {
  static const String routeName = "NewsDetails";

  NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late News newsArgs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    newsArgs = ModalRoute.of(context)!.settings.arguments as News;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Uri url = Uri.parse(newsArgs.url ?? '');

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            size: 30, color: Theme.of(context).secondaryHeaderColor),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          newsArgs.title ?? 'News Details'.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(height * .02),
        padding: EdgeInsets.all(height * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 2, color: Theme.of(context).secondaryHeaderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: newsArgs.urlToImage ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkGray,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: height * .01),
            Text(
              newsArgs.content ?? 'No content available',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: height * .01),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(vertical: height * .02),
                backgroundColor: Theme.of(context).secondaryHeaderColor,
              ),
              onPressed: () => _launchUrl(url),
              child: Text(
                'View Full Article'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }
}