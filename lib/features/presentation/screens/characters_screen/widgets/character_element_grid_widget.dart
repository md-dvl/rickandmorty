part of '../characters_screen.dart';

class _CharacterElementGridWidget extends StatelessWidget {
  const _CharacterElementGridWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(character.image ??
              'https://rickandmortyapi.com/api/character/avatar/7.jpeg'),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          character.status?.toUpperCase() ?? 'ALIVE',
          style: AppTextStyles.def10w500.copyWith(color: AppColors.color27AE60),
        ),
        Flexible(
          child: Text(
            character.name ?? 'Rick Sanchez',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.def16w500,
          ),
        ),
        Text(
          '${character.species}, ${character.gender}',
          style: AppTextStyles.def12w400,
        )
      ],
    );
  }
}
