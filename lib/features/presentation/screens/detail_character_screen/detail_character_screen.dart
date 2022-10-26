import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rickmorty/core/extension_context.dart';

import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/presentation/screens/characters_screen/widgets/character_status.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/theme/colors.dart';
import 'package:rickmorty/theme/text_styles.dart';

double width = 0;
double height = 0;

class DetailCharacterScreen extends StatelessWidget {
  const DetailCharacterScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: context.colors.bg2,
      body: _buildWithListViewBuilder(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildAva(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('${character.name}',
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
                      title: "Gender",
                      content: "${character.gender}"),
                  _buildTextContent(
                      context: context,
                      title: 'Species',
                      content: '${character.species}')
                ],
              ),
              SizedBox(height: 20.h),
              _buildColumnVector(
                context: context,
                title: 'Place of Birth',
                content: '${character.origin?.name}',
              ),
              SizedBox(height: 20.h),
              _buildColumnVector(
                context: context,
                title: 'Location',
                content: '${character.location?.name}',
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 36.0),
          child: Divider(
            thickness: 2,
            color: context.colors.searchBar,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Episodes',
                    style: AppTextStyles.def20w500.copyWith(
                      color: context.colors.baseColor,
                    ),
                  ),
                  Text(' All episodes',
                      style: AppTextStyles.def12w400.copyWith(
                        color: context.colors.greyCommonText,
                      ))
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h)
      ],
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

  Widget _buildItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
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
              Text('Episode'.toUpperCase(),
                  style: AppTextStyles.def10w500detailed.copyWith(
                    color: context.colors.navBar.withOpacity(0.87),
                  )),
              Text(
                'Pilot',
                style: AppTextStyles.def16w500.copyWith(
                  color: context.colors.baseColor,
                ),
              ),
              Text('13 dec',
                  style: AppTextStyles.def14w400detailed.copyWith(
                    fontSize: 12.h,
                    color: context.colors.episodeDate.withOpacity(0.6),
                  )),
            ],
          ),
          const Spacer(),
          Image.asset(
            'assets/images/vector.png',
            scale: 4,
          ),
          SizedBox(
            width: 9.h,
          )
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
        Text(title,
            style: AppTextStyles.def12w400.copyWith(
              color: context.colors.greyCommonText,
            )),
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
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        )
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
              color: context.colors.greyCommonText,
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
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            const Color(0xff0b1e2d63).withOpacity(0.39),
                            const Color(0xff0b1e2d63).withOpacity(0),
                            Colors.white.withOpacity(.01),
                          ],
                          stops: const [0, 0.37, 0.68, 1],
                        ),
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
                    ))
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
        )
      ],
    );
  }
}

extension DSize on num {
  double get w => this * width / 375;
  double get h => this * height / 812;
}
