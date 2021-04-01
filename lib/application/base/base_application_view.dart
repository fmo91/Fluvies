import 'package:flutter/material.dart';
import 'package:fluvies/application/movies_list/movies_list_screen.dart';

class BaseApplicationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Movies List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: MoviesListScreen(),
    );
  }
}
