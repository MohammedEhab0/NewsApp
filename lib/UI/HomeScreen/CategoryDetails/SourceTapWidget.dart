import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/Source_tap_name.dart';
import 'package:news/UI/HomeScreen/News/NewsWidget.dart';

import '../../../Modal/SourceResponse.dart';
import 'cubit/CubitSourceViewModel.dart';

class SourceTapWidget extends StatefulWidget {
  List<Source> sources = [];
  String categoryId;

  SourceTapWidget({required this.sources, required this.categoryId});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  CubitSourceViewModel viewModel = CubitSourceViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  indicatorColor: Theme.of(context).secondaryHeaderColor,
                  isScrollable: true,
                  onTap: (index) {
                    viewModel.changeSelectedIndex(newIndex: index);
                  },
                  tabs: widget.sources.map((source) {
                    return SourceTapName(
                        source: source,
                        isSelected: viewModel.selectedIndex ==
                            widget.sources.indexOf(source));
                  }).toList()),
              Expanded(
                  child: NewsWidget(
                      source: widget.sources[viewModel.selectedIndex]))
            ],
          )),
    );
  }
}
