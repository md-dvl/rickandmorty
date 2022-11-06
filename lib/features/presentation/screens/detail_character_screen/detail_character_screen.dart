import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/presentation/screens/characters_screen/widgets/character_status.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/theme/text_styles.dart';

class DetailCharacterScreen extends StatelessWidget {
  const DetailCharacterScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg2,
      body: _buildWithListViewBuilder(),
    );
  }

  Widget _buildWithListViewBuilder() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildBody(context);
        }
        return _buildItem(context);
      },
      itemCount: 4,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildAva(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('${character.name}',
              textAlign: TextAlign.center,
              style: AppTextStyles.def34w400.copyWith(
                color: context.colors.baseColor,
              )),
        ),
        SizedBox(height: 4.h),
        CharacterStatus(
            lifeStatus: character.status == 'Alive'
                ? LifeStatus.alive
                : character.status == 'Dead'
                    ? LifeStatus.dead
                    : LifeStatus.unknown),
        SizedBox(height: 36.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rick and Morty is an American adult animated science-fiction sitcom created by Justin Roiland and Dan Harmon for Cartoon Network\'s nighttime programming block Adult Swim',
                style: AppTextStyles.def13w400detailed.copyWith(
                  color: context.colors.baseColor,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  _buildTextContent(
                      context: context,
                      title: "Пол",
                      content: "${character.gender}"),
                  _buildTextContent(
                      context: context,
                      title: 'Раса',
                      content: '${character.species}')
                ],
              ),
              SizedBox(height: 20.h),
              _buildColumnVector(
                context: context,
                title: 'Место рождения',
                content: '${character.origin?.name}',
              ),
              SizedBox(height: 20.h),
              _buildColumnVector(
                context: context,
                title: 'Местоположение',
                content: '${character.location?.name}',
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 36.h),
          child: Divider(
            thickness: 2,
            color: context.colors.searchBar,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Эпизоды',
                    style: AppTextStyles.def20w500.copyWith(
                      color: context.colors.baseColor,
                    ),
                  ),
                  Text(
                    ' Все эпизоды',
                    style: AppTextStyles.def12w400.copyWith(
                      color: context.colors.elementsNotFound,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h)
      ],
    );
  }

  Widget _buildItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          SizedBox(
              height: 74.h,
              width: 74.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: (character.image != null)
                    ? Image.network(
                        character.image!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/rick_blurred.png',
                        fit: BoxFit.cover,
                      ),
              )),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Серия 1'.toUpperCase(),
                style: AppTextStyles.def10w500detailed.copyWith(
                  color: context.colors.checkbox.withOpacity(0.87),
                ),
              ),
              Text(
                'Пилот',
                style: AppTextStyles.def16w500.copyWith(
                  color: context.colors.baseColor,
                ),
              ),
              Text(
                '2 декабря 2013',
                style: AppTextStyles.def14w400detailed.copyWith(
                  fontSize: 12.h,
                  color: context.colors.episodeDate.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            'assets/images/vector.png',
            scale: 4,
            color: context.colors.baseColor,
          ),
          SizedBox(
            width: 9.h,
          ),
        ],
      ),
    );
  }

  Column _buildColumnVector({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.def12w400.copyWith(
            color: context.colors.elementsNotFound,
          ),
        ),
        Row(
          children: [
            Text(content,
                style: AppTextStyles.def14w400detailed.copyWith(
                  color: context.colors.baseColor,
                )),
            const Spacer(),
            Image.asset(
              'assets/images/vector.png',
              scale: 4,
              color: context.colors.baseColor,
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ],
    );
  }

  Expanded _buildTextContent({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.def12w400.copyWith(
              color: context.colors.elementsNotFound,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            content,
            style: AppTextStyles.def14w400detailed.copyWith(
              color: context.colors.baseColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAva(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    height: 218.h,
                    width: double.maxFinite,
                    child: (character.image != null)
                        ? Image.network(
                            character.image!,
                            fit: BoxFit.fitWidth,
                          )
                        : Image.asset(
                            'assets/images/rick_blurred.png',
                            fit: BoxFit.fitWidth,
                          )),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4,
                      sigmaY: 4,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: context.colors.gradient,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 58.h,
                    left: 24.w,
                  ),
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        AppImages.arrowBDetailscr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 73.h),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 146.w,
            width: 146.w,
            decoration: BoxDecoration(
              border: Border.all(width: 8, color: Colors.white),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: (character.image != null)
                    ? Image.network(
                        character.image!,
                        fit: BoxFit.fitWidth,
                      )
                    : Image.asset(
                        'assets/images/rick_blurred.png',
                        fit: BoxFit.fitWidth,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
