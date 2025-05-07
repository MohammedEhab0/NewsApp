import 'package:flutter/material.dart';
import 'package:news/Modal/Category.dart';

class CategoryFragment extends StatefulWidget {
  Function selectedCategory;

  CategoryFragment({required this.selectedCategory});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<Category> categoryList = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    categoryList = Category.getCategory();
    return Container(
      margin: EdgeInsets.all(height * .01),
      child: Column(
        children: [
          Text(
            'Good Morning \n Here is Some News For You',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.all(height * .01),
                        child: Stack(
                            alignment: (index % 2 == 0)
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                            children: [
                              Image.asset(categoryList[index].image),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: width * .0025),
                                margin: EdgeInsets.symmetric(
                                    vertical: height * .02,
                                    horizontal: width * .015),
                                width: width * .45,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(87)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width * .02,
                                    ),
                                    Text(
                                      'Veiw All',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(width * .005),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(87)),
                                      child: IconButton(
                                          padding: EdgeInsets.all(height * .01),
                                          onPressed: () {
                                            widget.selectedCategory(
                                                categoryList[index]);
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ]));
                  }))
        ],
      ),
    );
  }
}
