part of '../characters_screen.dart';

class _CharacterElementWidget extends StatelessWidget {
  const _CharacterElementWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 37,
          backgroundImage: NetworkImage(character.image ??
              'https://rickandmortyapi.com/api/character/avatar/7.jpeg'),
        ),
        const SizedBox(
          width: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character.status?.toUpperCase() ?? 'ALIVE',
              style: AppTextStyles.def10w500
                  .copyWith(color: AppColors.color27AE60),
            ),
            Text(
              character.name ?? 'Rick Sanchez',
              style: AppTextStyles.def16w500,
            ),
            Text(
              '${character.species}, ${character.gender}',
              style: AppTextStyles.def12w400,
            ),
          ],
        )
      ],
    );
  }
}
