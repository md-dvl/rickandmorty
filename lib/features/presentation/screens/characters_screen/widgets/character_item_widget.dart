part of '../characters_screen.dart';

class _CharacterItemWidget extends StatelessWidget {
  const _CharacterItemWidget({
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
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: character.image ??
                'https://rickandmortyapi.com/api/character/avatar/7.jpeg',
            placeholder: (context, url) => SizedBox(
                height: 74.h,
                width: 74.w,
                child: const Padding(
                  padding: EdgeInsets.all(22.0),
                  child: CircularProgressIndicator(),
                )),
            imageBuilder: (context, imageProvider) => Container(
              height: 74.h,
              width: 74.w,
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
            width: 18.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CharacterStatus(
                  lifeStatus: character.status == 'Alive'
                      ? LifeStatus.alive
                      : character.status == 'Dead'
                          ? LifeStatus.dead
                          : LifeStatus.unknown),
              SizedBox(
                width: 250.w,
                child: Text(
                  character.name ?? 'Rick Sanchez',
                  maxLines: 1,
                  style: AppTextStyles.def16w500.copyWith(
                    color: context.colors.baseColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${character.species}, ${character.gender}',
                style: AppTextStyles.def12w400.copyWith(
                  color: context.colors.greyCommonText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
