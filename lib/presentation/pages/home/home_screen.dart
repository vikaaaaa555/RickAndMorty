import 'package:flutter/material.dart';

import '../../../core/common/utils/constants/styles/text_styles.dart';
import '../../../feature/character/domain/entities/character_entity.dart';
import 'widgets/character_box.dart';

class HomeScreen extends StatefulWidget {
  final List<CharacterEntity> characters;

  const HomeScreen({super.key, required this.characters});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home', style: TextStyles.white22Bold),
          centerTitle: true,
          scrolledUnderElevation: 0.0),
      body: widget.characters.isEmpty
          ? Center(
              child: Text(
                'No characters available.',
                style: TextStyles.white12Normal,
              ),
            )
          : CustomScrollView(
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
