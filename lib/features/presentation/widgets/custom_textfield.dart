import 'package:flutter/material.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/theme/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyles.def14w400.copyWith(
              color: context.colors.baseColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            style: AppTextStyles.def16w400Black.copyWith(
              letterSpacing: 0.5,
              color: context.colors.baseColor,
            ),
            decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                filled: true,
                fillColor: context.colors.searchBar,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12))),
          ),
        ],
      ),
    );
  }
}
