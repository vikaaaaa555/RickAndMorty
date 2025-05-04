import 'package:flutter/material.dart';

import '../../../core/common/utils/constants/styles/text_styles.dart';
import '../../../feature/character/domain/entities/character_entity.dart';
import '../../widgets/character_box.dart';

class FavoritesScreen extends StatefulWidget {
  final List<CharacterEntity> characters;

  const FavoritesScreen({super.key, required this.characters});

  @override
  State<StatefulWidget> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Favorites', style: TextStyles.white22Bold),
          centerTitle: true,
          scrolledUnderElevation: 0.0),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final character = widget.characters[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CharacterBox(
                      name: character.name,
                      status: character.status,
                      species: character.species,
                      origin: character.origin,
                      image: character.image),
                );
              },
              childCount: widget.characters.length,
            ),
          ),
        ],
      ),
    );
  }
}
