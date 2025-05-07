import '../Utils/AppAssets.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});

//business entertainment general health science sports technology
  static List<Category> getCategory() {
    return [
      Category(id: 'general', title: 'General', image: AppAssets.general),
      Category(id: 'business', title: 'Business', image: AppAssets.business),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          image: AppAssets.entertainment),
      Category(id: 'health', title: 'Health', image: AppAssets.health),
      Category(id: 'science', title: 'Science', image: AppAssets.science),
      Category(
          id: 'technology', title: 'Technology', image: AppAssets.technology),
      Category(id: 'sports', title: 'Sports', image: AppAssets.sports),
    ];
  }
}
