import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/pages/home/widgets/character_box.dart';

import '../../../core/common/utils/constants/styles/text_styles.dart';
import '../../../feature/character/domain/entities/character_entity.dart';

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
          title: Text('Home', style: TextStyles.white22SemiBold),
          centerTitle: true,
          scrolledUnderElevation: 0.0),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (widget.characters.isEmpty) {
                  return const Center(child: Text('No characters available.'));
                }
                final character = widget.characters[index];
                return CharacterBox(
                    name: character.name,
                    status: character.status,
                    species: character.species,
                    origin: character.origin,
                    image: character.image);
              },
              childCount: widget.characters.length,
            ),
          ),
        ],
      ),
    );
  }
}
