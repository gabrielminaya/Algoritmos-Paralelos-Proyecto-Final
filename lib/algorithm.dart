class Algorithms {
  Future<double> busquedaSecuencial(List<int> array, dato) async {
    final stopwatch = Stopwatch()..start();

    stopwatch.reset();
    for (var item in array) {
      if (item == dato) {
        break;
      }
    }
    stopwatch.stop();
    print(
        'busquedaSecuencial() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
    return stopwatch.elapsed.inMicroseconds / 100000;
  }

  Future<double> bubbleSort(List array) async {
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
    return stopwatch.elapsed.inMicroseconds / 100000;
  }

  Future<double> quickSort(List array, int izq, int der) async {
    final stopwatch = Stopwatch()..start();

    stopwatch.reset();

    // quickSortExec(array, izq, der);
    array.sort();

    stopwatch.stop();
    print('quickSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
    return stopwatch.elapsed.inMicroseconds / 100000;
  }

  Future<double> insertionSort(List array) async {
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
    return stopwatch.elapsed.inMicroseconds / 100000;
  }

  Future<double> binarySearch(List array, dato) async {
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
    return stopwatch.elapsed.inMicroseconds / 100000;
  }
}
