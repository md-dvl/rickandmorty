part of '../settings_screen.dart';

Padding _editButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 4,
    ),
    child: SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: context.colors.checkbox,
                ),
                borderRadius: BorderRadius.circular(12))),
        child: Text(
          'Редактировать',
          style: AppTextStyles.def16w400.copyWith(
            color: context.colors.checkbox,
            letterSpacing: 0.15,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const SettingsEditScreen()),
            ),
          );
        },
      ),
    ),
  );
}
