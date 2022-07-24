import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marvel_characters/api.dart';
import 'package:marvel_characters/data/character.dart';
import 'package:marvel_characters/data/response.dart';
import 'package:marvel_characters/data/thumbnail.dart';

class ListHeroes extends StatefulWidget {
  const ListHeroes({Key? key}) : super(key: key);

  @override
  State<ListHeroes> createState() => _ListHeroesState();
}

class _ListHeroesState extends State<ListHeroes> {
  List<Character> _listCharacter = <Character>[];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _listCharacter.length,
      itemBuilder: (context, index) {
        Character character = _listCharacter[index];
        print("index $index");

        if (index >= (_listCharacter.length - 1)) {
          _loadData(contentLength: _listCharacter.length);
        }

        return ListTile(
          title: Text(character.name ?? ""),
          leading: Image.network(
              character.thumbnail!.getUrl(Thumbnail.stantardSmall)),
          subtitle: Text(character.description ?? ""),
        );
      },
    );
  }

  _loadData({int contentLength = 0}) async {
    var value = await API().getCharacters(offset: contentLength);
    Response response = Response.fromJson(json.decode(value.body));

    setState(() {
      _listCharacter.addAll(response.data?.character ?? <Character>[]);
    });
  }
}
