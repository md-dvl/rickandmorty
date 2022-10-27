part of '../filters_screen.dart';

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({
    Key? key,
    required CharacterBloc bloc,
  })  : _bloc = bloc,
        super(key: key);

  final CharacterBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.bg2,
      elevation: 0,
      titleSpacing: 0,
      title: Text(
        'Фильтры',
        style: AppTextStyles.def20w500.copyWith(
          color: context.colors.baseColor,
        ),
      ),
      leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset(
              AppImages.arrowB,
              color: context.colors.baseColor,
            ),
          ),
          onPressed: (() {
            _bloc.add(CharacterEvent.setFilters(
              status: _bloc.usecase.status,
              gender: _bloc.usecase.gender,
            ));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: ((context) => const MainScreen())),
                (route) => false);
          })),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
