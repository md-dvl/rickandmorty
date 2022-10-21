import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rickmorty/theme/colors.dart';
import 'package:rickmorty/theme/text_styles.dart';

double width = 0;
double height = 0;

class DetailCharacterScreen extends StatelessWidget {
  const DetailCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _buildWithListViewBuilder(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildAva(),
        const Text('Рик Санчез', style: AppTextStyles.def34w400),
        SizedBox(height: 4.h),
        Text(
          'Живой'.toUpperCase(),
          style: AppTextStyles.def10w500det,
        ),
        SizedBox(height: 36.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                style: AppTextStyles.def13w400det,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  _buildTextContent(title: "Пол", content: "Мужской"),
                  _buildTextContent(title: 'Раса', content: 'Человек')
                ],
              ),
              SizedBox(height: 20.h),
              _buildColumnVector(
                title: 'Место рождения',
                content: 'Земля C-137',
              ),
              SizedBox(height: 20.h),
              _buildColumnVector(
                title: 'Местоположение',
                content: 'Земля (Измерение подменны)',
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 36.0),
          child: Divider(
            thickness: 2,
            color: AppColors.colorF2F2F2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Эпизоды',
                    style: AppTextStyles.def20w500,
                  ),
                  Text(' Все эпизоды', style: AppTextStyles.def12w400)
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
          return _buildBody();
        }
        return _buildItem();
      },
      itemCount: 4,
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        children: [
          SizedBox(
              height: 74,
              width: 74,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/rick_blurred.png',
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Episode'.toUpperCase(),
                  style: AppTextStyles.def10w500det.copyWith(
                      color: AppColors.color22A2BD.withOpacity(0.87))),
              const Text(
                'Pilot',
                style: AppTextStyles.def16w500,
              ),
              Text('13 dec',
                  style: AppTextStyles.def14w400det.copyWith(
                      fontSize: 12.h,
                      color: AppColors.color6E798C.withOpacity(0.6))),
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

  Column _buildColumnVector({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.def12w400),
        Row(
          children: [
            Text(content, style: AppTextStyles.def14w400det),
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

  Expanded _buildTextContent({required String title, required String content}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.def12w400,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            content,
            style: AppTextStyles.def14w400det,
          ),
        ],
      ),
    );
  }

  Widget _buildAva() {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 218.h,
                  width: double.maxFinite,
                  child: Image.network(
                    'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
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
                child: Image.network(
                  'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
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
