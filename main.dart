import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/painting.dart';
import 'package:flutter/src/painting/basic_types.dart';
import 'package:flutter_app555/sortdropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reports',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Reports(),
    );
  }
}

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  static var chartdisplay;

  void initState() {
    setState(() {
      var data = [
        addcharts("January", 100000),
        addcharts("February", 200000),
        addcharts("March", 300000),
        addcharts("April", 150000),
        addcharts("May", 250000),
        addcharts("June", 400000),
      ];
      var series = [
        charts.Series(
          domainFn: (addcharts addcharts, _) => addcharts.label,
          measureFn: (addcharts addcharts, _) => addcharts.value,
          id: 'addcharts',
          data: data,
        ),
      ];

      chartdisplay = charts.BarChart(
        series,
        animationDuration: Duration(microseconds: 2000),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            print('Menu Icon');
          },
        ),
        title: Center(
          child: Text(
            'Reports',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.sort),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return SortDropdown.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                'Income Chart',
                style: TextStyle(fontSize: 25),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: chartdisplay,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: (Icon(
                          Icons.add,
                          size: 20,
                        )),
                        onPressed: () {
                          print('add months');
                        },
                      ),
                      Text(
                        'Add Months',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '1) January=',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '2) February=',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '2) March=',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Expenditure Chart',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: chartdisplay,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: (Icon(
                          Icons.add,
                          size: 20,
                        )),
                        onPressed: () {
                          print('add months');
                        },
                      ),
                      Text(
                        'Add Months',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '1) January',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '2) February',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '3) March',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class addcharts {
  final String label;
  final int value;
  addcharts(this.label, this.value);
}

void choiceAction(String choice) {
  if (choice == SortDropdown.Quaterly) {
    print('Quaterly');
  } else if (choice == SortDropdown.HalfYearly) {
    print('HalfYearly');
  }
}

class AddMonths extends StatefulWidget {
  String text;
  AddMonths(this.text);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }
}
