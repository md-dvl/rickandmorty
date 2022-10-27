part of '../settings_edit_screen.dart';

class FioLoginWidget extends StatelessWidget {
  const FioLoginWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.def16w400Black.copyWith(
                color: context.colors.baseColor.withOpacity(0.87),
              ),
            ),
            Text(
              subtitle,
              style: AppTextStyles.def14w400.copyWith(
                color: context.colors.greyCommonText,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: GestureDetector(
            onTap: onTap,
            child: Image.asset(
              AppImages.arrowF,
              color: context.colors.baseColor,
            ),
          ),
        )
      ],
    );
  }
}
