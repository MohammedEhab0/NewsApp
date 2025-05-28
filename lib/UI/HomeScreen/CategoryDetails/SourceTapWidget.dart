import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Dip/Dip.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/Source_tap_name.dart';
import 'package:news/UI/HomeScreen/News/NewsWidget.dart';

import '../../../Modal/SourceResponse.dart';
import '../News/Cubit/CubitNewsViewModel.dart';
import 'cubit/CubitSourceViewModel.dart';

class SourceTapWidget extends StatefulWidget {
  List<Source> sources = [];

  int selectedIndex = 0;
  SourceTapWidget({required this.sources});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  CubitSourceViewModel viewModel = CubitSourceViewModel(sourceRepository: injectSourceRepository());
  CubitNewsViewModel newsViewModel = CubitNewsViewModel(newsRepository: injectNewsRepository());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitSourceViewModel>(create: (context) => viewModel),
        BlocProvider<CubitNewsViewModel>(create: (context) => newsViewModel)
      ],
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
                    setState(() {
                      widget.selectedIndex=index;
                      newsViewModel.selectedIndex=index;
                    });


                  },
                  tabs: widget.sources.map((source) {
                    return SourceTapName(
                        source: source,
                        isSelected: widget.selectedIndex ==
                            widget.sources.indexOf(source));
                  }).toList()),
              Expanded(
                  child: NewsWidget(
                      source: widget.sources[newsViewModel.selectedIndex]))
            ],
          )),
    );
  }
}
