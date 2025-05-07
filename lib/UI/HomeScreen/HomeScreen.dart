import 'package:flutter/material.dart';
import 'package:news/Modal/Category.dart';
import 'package:news/UI/HomeScreen/CategoryFragment.dart';
import 'package:news/UI/HomeScreen/NewsDrawer.dart';

import 'CategoryDetails/CategoryDetails.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  Category? selectedCategory;

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {},
            icon: Icon(
              size: 30,
              Icons.search_outlined,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          )
        ],
        title: Text(
          widget.selectedCategory == null
              ? 'Home'
              : widget.selectedCategory!.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: height * .02),
          child: widget.selectedCategory == null
              ? CategoryFragment(
                  selectedCategory: newCategory,
                )
              : CategoryDetails(
                  category: widget.selectedCategory!,
                )),
    );
  }

  newCategory(Category newCategory) {
    widget.selectedCategory = newCategory;
    setState(() {});
  }
}
