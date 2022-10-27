part of '../settings_fio_edit.dart';

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.bg2,
      elevation: 0,
      titleSpacing: 0,
      title: Text(
        'Изменить ФИО',
        style: AppTextStyles.def20w500.copyWith(
          color: context.colors.baseColor,
        ),
      ),
      leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              AppImages.arrowB,
              color: context.colors.baseColor,
            ),
          ),
          onPressed: (() {
            Navigator.pop(context);
          })),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
