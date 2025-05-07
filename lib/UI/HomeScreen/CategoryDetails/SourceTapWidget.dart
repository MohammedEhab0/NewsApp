import 'package:flutter/material.dart';
import 'package:news/UI/HomeScreen/CategoryDetails/Source_tap_name.dart';
import 'package:news/UI/HomeScreen/News/NewsWidget.dart';

import '../../../Modal/SourceResponse.dart';

class SourceTapWidget extends StatefulWidget {
  List<Source> sources = [];

  SourceTapWidget({required this.sources});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorColor: Theme.of(context).secondaryHeaderColor,
                isScrollable: true,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sources.map((source) {
                  return SourceTapName(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sources.indexOf(source));
                }).toList()),
            Expanded(child: NewsWidget(source: widget.sources[selectedIndex]))
          ],
        ));
  }
}
