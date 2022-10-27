part of '../characters_screen.dart';

class _CharacterItemGridWidget extends StatelessWidget {
  const _CharacterItemGridWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailCharacterScreen(
                      character: character,
                    )));
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: character.image ??
                'https://rickandmortyapi.com/api/character/avatar/7.jpeg',
            placeholder: (context, url) => SizedBox(
                height: 120.h,
                width: 120.w,
                child: const Padding(
                  padding: EdgeInsets.all(36.0),
                  child: CircularProgressIndicator(),
                )),
            imageBuilder: (context, imageProvider) => Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          CharacterStatus(
              lifeStatus: character.status == 'Alive'
                  ? LifeStatus.alive
                  : character.status == 'Dead'
                      ? LifeStatus.dead
                      : LifeStatus.unknown),
          Flexible(
            child: Text(
              character.name ?? 'Rick Sanchez',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.def16w500.copyWith(
                color: context.colors.baseColor,
              ),
            ),
          ),
          Text(
            '${character.species}, ${character.gender}',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.def12w400.copyWith(
              color: context.colors.greyCommonText,
            ),
          )
        ],
      ),
    );
  }
}
