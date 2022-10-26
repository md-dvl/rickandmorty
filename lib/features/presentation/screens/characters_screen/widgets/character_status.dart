import 'package:flutter/material.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/theme/text_styles.dart';

enum LifeStatus { alive, dead, unknown }

class CharacterStatus extends StatelessWidget {
  final LifeStatus lifeStatus;

  const CharacterStatus({
    Key? key,
    required this.lifeStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      lifeStatus == LifeStatus.alive
          ? 'ALIVE'
          : lifeStatus == LifeStatus.dead
              ? 'DEAD'
              : 'UNKNOWN',
      style: AppTextStyles.def10w500.copyWith(
        color: lifeStatus == LifeStatus.alive
            ? context.colors.statusGreenGrid
            : lifeStatus == LifeStatus.dead
                ? context.colors.statusRed
                : context.colors.greyCommonText,
      ),
    );
  }
}
