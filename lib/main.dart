import 'dart:ffi';
import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_algoritmos_paralelos/algorithm.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  defineRoutes(router);

  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.indigo.shade600,
        accentColor: Colors.pink.shade600,
      ),
      home: SplashPage(),
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
    resetArray();
    super.initState();
  }

  resetArray() {
    array1 = [for (var i = 0; i < 20000; i++) rng.nextInt(1000)];
    array2 = [for (var i = 0; i < 20000; i++) array1[i]];
    array3 = [for (var i = 0; i < 20000; i++) array1[i]];
    array4 = [for (var i = 0; i < 20000; i++) array1[i]];
    array5 = [for (var i = 0; i < 20000; i++) array1[i]];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROYECTO FINAL ALGORITMOS PARALELOS"),
        centerTitle: true,
      ),
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
                                        child: Text('$busquedaSecuencialValue ms',
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
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ArrayPage(
                                  array: array1,
                                  titleStr: "Array de Busqueda Secuencial.",
                                );
                              },
                            ));
                          },
                          icon: Icon(Icons.list_alt_rounded),
                          label: Text("Array de Busqueda Secuencial"),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: () async {
                            busquedaSecuencialValue = await algorithms.busquedaSecuencial(
                              array1,
                              rng.nextInt(1000),
                            );
                            setState(() {});
                          },
                          icon: Icon(Icons.access_alarm_rounded),
                          label: Text("Busqueda Secuencial"),
                        ),
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
                                        child: Text('$bubbleSortValue ms',
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
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ArrayPage(
                                  array: array2,
                                  titleStr: "Array de Ordenamiento de burbuja.",
                                );
                              },
                            ));
                          },
                          icon: Icon(Icons.list_alt_rounded),
                          label: Text("Array de ordenamiento de burbuja"),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: () async {
                            bubbleSortValue = await algorithms.bubbleSort(array2);
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
                                        child: Text('$quickSortValue ms',
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
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ArrayPage(
                                  array: array3,
                                  titleStr: "Array de Ordenamiento rápido.",
                                );
                              },
                            ));
                          },
                          icon: Icon(Icons.list_alt_rounded),
                          label: Text("Array de Ordenamiento rápido"),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: () async {
                            quickSortValue = await algorithms.quicksort(array3);
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
                                        child: Text('$insertionSortValue ms',
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
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ArrayPage(
                                  array: array4,
                                  titleStr: "Array de Ordenamiento por inserción.",
                                );
                              },
                            ));
                          },
                          icon: Icon(Icons.list_alt_rounded),
                          label: Text("Array de Ordenamiento por inserción"),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: () async {
                            insertionSortValue = await algorithms.insertionSort(array4);
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
                                        child: Text('$binarySearchValue ms',
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
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ArrayPage(
                                  array: array5,
                                  titleStr: "Array de Búsqueda binaria.",
                                );
                              },
                            ));
                          },
                          icon: Icon(Icons.list_alt_rounded),
                          label: Text("Array de Búsqueda binaria"),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: () async {
                            binarySearchValue =
                                await algorithms.binarySearch(array5, rng.nextInt(1000));
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
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  // quickSortValue = await algorithms.quicksort(
                  //   array,
                  //   0,
                  //   array.length - 1,
                  // );

                  busquedaSecuencialValue = await algorithms.busquedaSecuencial(
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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).errorColor,
              ),
              onPressed: () async {
                busquedaSecuencialValue = 0.0;
                bubbleSortValue = 0.0;
                quickSortValue = 0.0;
                insertionSortValue = 0.0;
                binarySearchValue = 0.0;
                resetArray();
                setState(() {});
              },
              icon: Icon(Icons.delete_sweep_rounded),
              label: Text("Reiniciar todos los Arrays"),
            ),
          ],
        ),
      ),
    );
  }
}

final router = FluroRouter();

final mainPageHandler = Handler(
  handlerFunc: (context, parameters) {
    return MainPage();
  },
);

void defineRoutes(FluroRouter router) {
  router.define("/mainPage", handler: mainPageHandler);
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      router.navigateTo(
        context,
        "/mainPage",
        replace: true,
        transition: TransitionType.fadeIn,
        transitionDuration: Duration(seconds: 2),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "DESARROLLADO POR:",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Text(
              "Gabriel Alejando Minaya Castro 1-15-0012",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Mary Elizabeth Peña  Paulino, 1-16-2844",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Victor José Gonzalez Bencosme, 2-16-1220",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Leonilda María Ureña García 2-16-1748",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}

class ArrayPage extends StatelessWidget {
  final String titleStr;
  final List<int> array;

  const ArrayPage({Key? key, required this.titleStr, required this.array})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
      ),
      body: Container(
        child: TextFormField(
          maxLines: 30,
          controller: TextEditingController(text: array.toString()),
          readOnly: true,
        ),
      ),
    );
  }
}
