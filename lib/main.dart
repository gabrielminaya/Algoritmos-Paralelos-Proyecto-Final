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
  List<int> array = [];

  var busquedaSecuencialValue = 0.0;
  var bubbleSortValue = 0.0;
  var quickSortValue = 0.0;
  var insertionSortValue = 0.0;
  var binarySearchValue = 0.0;

  @override
  void initState() {
    array = [for (var i = 0; i < 10000; i++) rng.nextInt(1000)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                                    startValue: 0.0, endValue: .33, color: Colors.green),
                                GaugeRange(
                                    startValue: .33, endValue: .66, color: Colors.orange),
                                GaugeRange(
                                    startValue: .66, endValue: 1, color: Colors.red),
                              ],
                              pointers: [
                                NeedlePointer(value: busquedaSecuencialValue),
                              ],
                              annotations: [
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('$busquedaSecuencialValue s',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () async {
                            busquedaSecuencialValue = await algorithms.busquedaSecuencial(
                              array,
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
                                    startValue: 0.0, endValue: .33, color: Colors.green),
                                GaugeRange(
                                    startValue: .33, endValue: .66, color: Colors.orange),
                                GaugeRange(
                                    startValue: .66, endValue: 1, color: Colors.red),
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
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () async {
                            bubbleSortValue = await algorithms.bubbleSort(array);
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
                                    startValue: 0.0, endValue: .33, color: Colors.green),
                                GaugeRange(
                                    startValue: .33, endValue: .66, color: Colors.orange),
                                GaugeRange(
                                    startValue: .66, endValue: 1, color: Colors.red),
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
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () async {
                            quickSortValue = await algorithms.quickSort(
                              array,
                              0,
                              array.length - 1,
                            );
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
                                    startValue: 0.0, endValue: .33, color: Colors.green),
                                GaugeRange(
                                    startValue: .33, endValue: .66, color: Colors.orange),
                                GaugeRange(
                                    startValue: .66, endValue: 1, color: Colors.red),
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
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () async {
                            insertionSortValue = await algorithms.insertionSort(array);
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
                                    startValue: 0.0, endValue: .33, color: Colors.green),
                                GaugeRange(
                                    startValue: .33, endValue: .66, color: Colors.orange),
                                GaugeRange(
                                    startValue: .66, endValue: 1, color: Colors.red),
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
                                                fontWeight: FontWeight.bold))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () async {
                            binarySearchValue =
                                await algorithms.binarySearch(array, rng.nextInt(1000));
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
                  busquedaSecuencialValue = await algorithms.busquedaSecuencial(
                    array,
                    2,
                  );
                  bubbleSortValue = await algorithms.bubbleSort(array);
                  insertionSortValue = await algorithms.insertionSort(array);
                  quickSortValue = await algorithms.quickSort(
                    array,
                    0,
                    array.length - 1,
                  );
                  binarySearchValue = await algorithms.binarySearch(
                    array,
                    rng.nextInt(1000),
                  );

                  setState(() {});
                },
                icon: Icon(Icons.access_time_rounded),
                label: Text("INICIAR CARRERA"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
