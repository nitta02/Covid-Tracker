// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:covid_tracker_app/widgets/info_Row.dart';

class DetailsScreen extends StatefulWidget {
  String name;
  String continent;
  // double oneCasePerPeople;
  // double oneTestPerPeople;
  // double oneDeathPerPeople;
  // double activePerOneMillion;
  DetailsScreen({
    Key? key,
    required this.name,
    required this.continent,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              InfoRowWidget(title: "Continental", value: widget.continent),
            ],
          )
        ],
      ),
    );
  }
}
