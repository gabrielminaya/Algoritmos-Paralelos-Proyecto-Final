import 'dart:math';

main() async {
  var rng = new Random();

  var array = [for (var i = 0; i < 100000; i++) rng.nextInt(100)];

  busquedaSecuencial(array, rng.nextInt(100));
  quickSort(array, 0, array.length - 1);
  bubbleSort(array);
  insertionSort(array);

  binarySearch(array, rng.nextInt(100));
}

Future<void> busquedaSecuencial(List<int> array, dato) async {
  final stopwatch = Stopwatch()..start();

  stopwatch.reset();
  for (var item in array) {
    if (item == dato) {
      break;
    }
  }
  stopwatch.stop();
  print('busquedaSecuencial() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
  return;
}

Future<void> bubbleSort(List array) async {
  final stopwatch = Stopwatch()..start();

  stopwatch.reset();

  for (var i = 0; i <= array.length; i++) {
    for (var j = 0; j < array.length - 1; j++) {
      if (array[j] > array[j + 1]) {
        array[j] = array[j + 1];
        array[j + 1] = array[j];
      }
    }
  }
  stopwatch.stop();
  print('bubbleSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
  return;
}

Future<void> binarySearch(List array, dato) async {
  final stopwatch = Stopwatch()..start();

  array.sort();

  stopwatch.reset();

  int inicio = 0;
  int fin = array.length - 1;
  int pos;
  while (inicio <= fin) {
    pos = (inicio + fin) ~/ 2;
    if (array[pos] == dato)
      break;
    else if (array[pos] < dato) {
      inicio = pos + 1;
    } else {
      fin = pos - 1;
    }
  }
  stopwatch.stop();
  print('binarySearch() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
  return;
}

quickSortExec(List array, int izq, int der) {
  int pivote = array[izq];
  int i = izq;
  int j = der;
  int aux;

  while (i < j) {
    while (array[i] <= pivote && i < j) i++;
    while (array[j] > pivote) j--;

    if (i < j) {
      aux = array[i];
      array[i] = array[j];
      array[j] = aux;
    }
  }

  array[izq] = array[j];
  array[j] = pivote;

  if (izq < j - 1) quickSortExec(array, izq, j - 1);
  if (j + 1 < der) quickSortExec(array, j + 1, der);

  return;
}

Future<void> quickSort(List array, int izq, int der) async {
  final stopwatch = Stopwatch()..start();

  stopwatch.reset();

  // quickSortExec(array, izq, der);
  array.sort();

  stopwatch.stop();
  print('quickSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
  return;
}

Future<void> insertionSort(List array) async {
  final stopwatch = Stopwatch()..start();

  stopwatch.reset();

  for (var i = 0; i < array.length; i++) {
    final value = array[i];

    var j = i - 1;
    while (j >= 0 && value < array[j]) {
      array[j + 1] = array[j];
      j -= 1;
      array[j + 1] = value;
    }
  }

  stopwatch.stop();
  print('insertionSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
  return;
}
