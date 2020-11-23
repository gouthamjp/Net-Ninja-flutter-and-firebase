import 'package:fireapp/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './brewTile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<List<Brew>>(context);

    return ListView.builder(
      itemCount: brew.length,
      itemBuilder: (ctx, index) {
        return BrewTile(brew : brew[index]);
      },
    );
  }
}
