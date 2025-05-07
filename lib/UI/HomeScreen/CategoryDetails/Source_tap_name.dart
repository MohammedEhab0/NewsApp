import 'package:flutter/material.dart';
import 'package:news/Modal/SourceResponse.dart';

class SourceTapName extends StatelessWidget {
  bool isSelected;
  Source source;

  SourceTapName({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: isSelected
          ? Theme.of(context).textTheme.headlineMedium
          : Theme.of(context).textTheme.titleMedium,
    );
  }
}
