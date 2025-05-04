import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/common/utils/constants/styles/text_styles.dart';

import '../../../../core/common/utils/constants/styles/app_colors.dart';
import '../../../../feature/character/domain/entities/location.dart';
import '../../../../media.dart';

class CharacterBox extends StatelessWidget {
  final String name;
  final String status;
  final String species;
  final Location origin;
  final String image;

  const CharacterBox({
    super.key,
    required this.name,
    required this.status,
    required this.species,
    required this.origin,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: Media.screenHeight * 0.2,
        color: AppColors.blackSabbath,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                image,
                height: Media.screenHeight * 0.4,
                width: Media.screenWidth * 0.4,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyles.white18SemiBoldItalic,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      status,
                      style: TextStyles.white16Medium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      species,
                      style: TextStyles.white16Medium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      origin.name,
                      style: TextStyles.white16Medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
