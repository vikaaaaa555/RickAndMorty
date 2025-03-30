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
        color: AppColors.blackSabbath,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                image,
                height: Media.screenHeight * 0.01,
                width: Media.screenWidth * 0.1,
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyles.white12Medium,
                  ),
                  const Spacer(),
                  Text(
                    status,
                    style: TextStyles.white12Normal,
                  ),
                  const Spacer(),
                  Text(
                    species,
                    style: TextStyles.white12Normal,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        origin.name,
                        style: TextStyles.white12Normal,
                      ),
                      Image.network(
                        origin.url,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}