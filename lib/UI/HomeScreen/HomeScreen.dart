import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/Modal/Category.dart';
import 'package:news/UI/HomeScreen/CategoryFragment.dart';
import 'package:news/UI/HomeScreen/News/NewSearch.dart';
import 'package:news/UI/HomeScreen/NewsDrawer.dart';

import '../Widgets/CustomTextField.dart';
import 'CategoryDetails/CategoryDetails.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  Category? selectedCategory;

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? SearchController;
  bool isSearching = false;
  bool searchingResult = false;

  @override
  void initState() {
    super.initState();
    SearchController = TextEditingController();
  }

  @override
  void dispose() {
    SearchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: NewsDrawer(goHome: () {
          widget.selectedCategory = null;
          Navigator.pop(context);
          setState(() {});
        }),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
            size: 30, color: Theme.of(context).secondaryHeaderColor),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                searchingResult = false;
              });
            },
            icon: Icon(
              size: 30,
              Icons.search_outlined,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          )
        ],
        title: Text(
          widget.selectedCategory == null
              ? 'home'.tr()
              : widget.selectedCategory!.title.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: height * .02),
          child: Column(
            children: [
              isSearching == true
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * .05, vertical: height * .02),
                      child: CustomTextField(
                        controller: SearchController,
                        hintText: "Search",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              searchingResult = true;
                            });
                          },
                          icon: Icon(
                            size: 30,
                            Icons.search_outlined,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              searchingResult == true && SearchController!.text.isNotEmpty
                  ? Expanded(
                      child: NewSearch(SearchString: SearchController!.text))
                  : Expanded(
                      child: widget.selectedCategory == null
                          ? CategoryFragment(
                              selectedCategory: newCategory,
                            )
                          : CategoryDetails(
                              category: widget.selectedCategory!,
                            ))
            ],
          )),
    );
  }

  newCategory(Category newCategory) {
    widget.selectedCategory = newCategory;
    setState(() {});
  }
}
