// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, sort_child_properties_last

import 'package:covid_tracker_app/Models/worldStatusModel.dart';
import 'package:covid_tracker_app/constants/color_constants.dart';
import 'package:covid_tracker_app/countries_screen.dart';
import 'package:covid_tracker_app/services/api_services.dart';
import 'package:covid_tracker_app/widgets/info_Row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 5), vsync: this);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ApiServices _apiServices = ApiServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
              future: _apiServices.getApi(),
              builder: (context, AsyncSnapshot<WorldStatusModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50.0,
                      controller: _controller,
                    ),
                    flex: 1,
                  );
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          'Total':
                              double.parse(snapshot.data!.cases.toString()),
                          'Late':
                              double.parse(snapshot.data!.recovered.toString()),
                          'Recent':
                              double.parse(snapshot.data!.deaths.toString()),
                        },
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        chartType: ChartType.ring,
                        colorList: colorList,
                        ringStrokeWidth: 20.0,
                        animationDuration: const Duration(seconds: 5),
                        chartRadius: MediaQuery.of(context).size.width / 2.1,
                        legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                            child: Column(children: [
                          InfoRowWidget(
                              title: 'Total Affected : ',
                              value: snapshot.data!.cases.toString()),
                          InfoRowWidget(
                              title: 'Total Deaths : ',
                              value: snapshot.data!.deaths.toString()),
                          InfoRowWidget(
                              title: 'Total Affected Coutries :',
                              value:
                                  snapshot.data!.affectedCountries.toString()),
                        ])),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CountriesScreen(),
                              ));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green,
                          ),
                          child: const Center(child: Text('Track Countries')),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
