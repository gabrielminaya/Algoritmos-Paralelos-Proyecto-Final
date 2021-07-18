import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proyecto_algoritmos_paralelos/algorithm.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData.light(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final algorithms = Algorithms();

  final rng = new Random();
  List<int> array1 = [];
  List<int> array2 = [];
  List<int> array3 = [];
  List<int> array4 = [];
  List<int> array5 = [];

  var busquedaSecuencialValue = 0.0;
  var bubbleSortValue = 0.0;
  var quickSortValue = 0.0;
  var insertionSortValue = 0.0;
  var binarySearchValue = 0.0;

  @override
  void initState() {
    array1 = [for (var i = 0; i < 20000; i++) rng.nextInt(1000)];
    array2 = [for (var i = 0; i < 20000; i++) array1[i]];
    array3 = [for (var i = 0; i < 20000; i++) array1[i]];
    array4 = [for (var i = 0; i < 20000; i++) array1[i]];
    array5 = [for (var i = 0; i < 20000; i++) array1[i]];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SfRadialGauge(
                            axes: [
                              RadialAxis(
                                minimum: 0,
                                maximum: 1,
                                ranges: [
                                  GaugeRange(
                                      startValue: 0.0,
                                      endValue: .33,
                                      color: Colors.green),
                                  GaugeRange(
                                      startValue: .33,
                                      endValue: .66,
                                      color: Colors.orange),
                                  GaugeRange(
                                      startValue: .66,
                                      endValue: 1,
                                      color: Colors.red),
                                ],
                                pointers: [
                                  NeedlePointer(value: busquedaSecuencialValue),
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text(
                                              '$busquedaSecuencialValue s',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      angle: 90,
                                      positionFactor: 0.5)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () async {
                              busquedaSecuencialValue =
                                  await algorithms.busquedaSecuencial(
                                array1,
                                rng.nextInt(1000),
                              );
                              setState(() {});
                            },
                            icon: Icon(Icons.access_alarm_rounded),
                            label: Text("Busqueda Secuencial"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SfRadialGauge(
                            axes: [
                              RadialAxis(
                                minimum: 0,
                                maximum: 1,
                                ranges: [
                                  GaugeRange(
                                      startValue: 0.0,
                                      endValue: .33,
                                      color: Colors.green),
                                  GaugeRange(
                                      startValue: .33,
                                      endValue: .66,
                                      color: Colors.orange),
                                  GaugeRange(
                                      startValue: .66,
                                      endValue: 1,
                                      color: Colors.red),
                                ],
                                pointers: [
                                  NeedlePointer(value: bubbleSortValue),
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('$bubbleSortValue s',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      angle: 90,
                                      positionFactor: 0.5)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () async {
                              bubbleSortValue =
                                  await algorithms.bubbleSort(array2);
                              setState(() {});
                            },
                            icon: Icon(Icons.access_alarm_rounded),
                            label: Text("Ordenamiento de burbuja"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SfRadialGauge(
                            axes: [
                              RadialAxis(
                                minimum: 0,
                                maximum: 1,
                                ranges: [
                                  GaugeRange(
                                      startValue: 0.0,
                                      endValue: .33,
                                      color: Colors.green),
                                  GaugeRange(
                                      startValue: .33,
                                      endValue: .66,
                                      color: Colors.orange),
                                  GaugeRange(
                                      startValue: .66,
                                      endValue: 1,
                                      color: Colors.red),
                                ],
                                pointers: [
                                  NeedlePointer(value: quickSortValue),
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('$quickSortValue s',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      angle: 90,
                                      positionFactor: 0.5)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () async {
                              quickSortValue =
                                  await algorithms.quicksort(array3);
                              // quickSortValue = await algorithms.quicksort(
                              //   array,
                              //   0,
                              //   array.length-1,
                              // );
                              setState(() {});
                            },
                            icon: Icon(Icons.access_alarm_rounded),
                            label: Text("Ordenamiento rápido"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SfRadialGauge(
                            axes: [
                              RadialAxis(
                                minimum: 0,
                                maximum: 1,
                                ranges: [
                                  GaugeRange(
                                      startValue: 0.0,
                                      endValue: .33,
                                      color: Colors.green),
                                  GaugeRange(
                                      startValue: .33,
                                      endValue: .66,
                                      color: Colors.orange),
                                  GaugeRange(
                                      startValue: .66,
                                      endValue: 1,
                                      color: Colors.red),
                                ],
                                pointers: [
                                  NeedlePointer(value: insertionSortValue),
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('$insertionSortValue s',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      angle: 90,
                                      positionFactor: 0.5)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () async {
                              insertionSortValue =
                                  await algorithms.insertionSort(array4);
                              setState(() {});
                            },
                            icon: Icon(Icons.access_alarm_rounded),
                            label: Text("Ordenamiento por inserción"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SfRadialGauge(
                            axes: [
                              RadialAxis(
                                minimum: 0,
                                maximum: 1,
                                ranges: [
                                  GaugeRange(
                                      startValue: 0.0,
                                      endValue: .33,
                                      color: Colors.green),
                                  GaugeRange(
                                      startValue: .33,
                                      endValue: .66,
                                      color: Colors.orange),
                                  GaugeRange(
                                      startValue: .66,
                                      endValue: 1,
                                      color: Colors.red),
                                ],
                                pointers: [
                                  NeedlePointer(value: binarySearchValue),
                                ],
                                annotations: [
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text('$binarySearchValue s',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      angle: 90,
                                      positionFactor: 0.5)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () async {
                              binarySearchValue = await algorithms.binarySearch(
                                  array5, rng.nextInt(1000));
                              setState(() {});
                            },
                            icon: Icon(Icons.access_alarm_rounded),
                            label: Text("Búsqueda binaria"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    // quickSortValue = await algorithms.quicksort(
                    //   array,
                    //   0,
                    //   array.length - 1,
                    // );

                    busquedaSecuencialValue =
                        await algorithms.busquedaSecuencial(
                      array1,
                      array1[570],
                    );
                    bubbleSortValue = await algorithms.bubbleSort(array2);
                    insertionSortValue = await algorithms.insertionSort(array3);
                    quickSortValue = await algorithms.quicksort(array4);
                    binarySearchValue = await algorithms.binarySearch(
                      array5,
                      array5[570],
                    );
                    setState(() {});
                  },
                  icon: Icon(Icons.access_time_rounded),
                  label: Text("INICIAR CARRERA"),
                ),
              ),
              Container(
                  height: 40.0,
                  child: Column(
                    children: [
                      Text("Búsqueda Secuencial"),
                      Text(
                        array1.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              Container(
                  height: 40.0,
                  child: Column(
                    children: [
                      Text("Ordenamiento de burbuja"),
                      Text(
                        array1.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              Container(
                  height: 40.0,
                  child: Column(
                    children: [
                      Text("Ordenamiento Rápido"),
                      Text(
                        array1.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              Container(
                  height: 40.0,
                  child: Column(
                    children: [
                      Text("Ordenamiento por inserción"),
                      Text(
                        array1.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              Container(
                  height: 40.0,
                  child: Column(
                    children: [
                      Text("Búsqueda binaria"),
                      Text(
                        array1.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
