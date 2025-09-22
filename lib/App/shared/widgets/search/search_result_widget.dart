import 'package:flutter/material.dart';

class SearchResultWidget<T> extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsets padding;
  final double spacing;

  const SearchResultWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding = const EdgeInsets.all(16),
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemCount: itemCount,
      separatorBuilder: (_, __) => SizedBox(height: spacing),
      itemBuilder: itemBuilder,
    );
  }
}
