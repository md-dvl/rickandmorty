import 'package:flutter/material.dart';
import 'package:rickmorty/core/extension_context.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.vertPadding,
    required this.thickness,
  }) : super(key: key);
  final double vertPadding;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertPadding),
      child: Divider(
        color: context.colors.searchBar,
        thickness: thickness,
      ),
    );
  }
}
