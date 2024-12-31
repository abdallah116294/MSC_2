import 'package:flutter/material.dart';

class SearchScreenView extends StatelessWidget {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchScreenBody();
  }
}
class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Text("Search Screen"),
    );
  }
}