part of '../settings_screen.dart';

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    Key? key,
    required UserBloc bloc,
  })  : _bloc = bloc,
        super(key: key);

  final UserBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 18.h,
      ),
      child: BlocProvider.value(
        value: _bloc..add(const UserEvent.getModel()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(child: CircularProgressIndicator()),
              successGet: ((user) => Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: user.avatar,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 239.w,
                            child: Text(
                                '${user.name} ${user.surname} ${user.patronymic}',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.def16w400Black.copyWith(
                                  color: context.colors.baseColor,
                                )),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            width: 239.w,
                            child: Text(
                              user.login,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.def14w400.copyWith(
                                color: context.colors.greyCommonText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
