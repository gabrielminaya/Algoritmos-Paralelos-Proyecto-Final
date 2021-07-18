import 'stack.dart';
// import 'package:flutter/cupertino.dart';

class Algorithms {
  Future<double> busquedaSecuencial(List<int> array, dato) async {
    final stopwatch = Stopwatch()..start();

    stopwatch.reset();
    for (var item in array) {
      if (item == dato) {
        continue;
      }
    }
    stopwatch.stop();
    print("secuencial$array");
    print(
        'busquedaSecuencial() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');

    return stopwatch.elapsed.inMicroseconds / 100000;
  }

  Future<double> bubbleSort(List<int> array) async {
    final stopwatch = Stopwatch()..start();

    stopwatch.reset();

    int n = array.length;
    int temp = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 1; j < (n - i); j++) {
        if (array[j - 1] > array[j]) {
          //swap elements
          temp = array[j - 1];
          array[j - 1] = array[j];
          array[j] = temp;
        }
      }
    }
    stopwatch.stop();
    print("bubble $array");
    print(
        'bubbleSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
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
    print("insertion $array");
    print(
        'insertionSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
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
    print("binary $array");
    print(
        'binarySearch() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
    return stopwatch.elapsed.inMicroseconds / 100000;
  }

  // int partition(List arr, l, h) {
  //   int i = (l - 1);
  //   int x = arr[h];

  //   for (int j = l; j <= h; j++) {
  //     if (arr[j] <= x) {
  //       // increment index of smaller element
  //       i = i + 1;
  //       int temp = arr[i];
  //       arr[i] = arr[j];
  //       arr[j] = temp;
  //     }
  //   }

  //   int temp = arr[i + 1];
  //   arr[i + 1] = arr[h];
  //   arr[h] = temp;
  //   return (i + 1);
  // }
  void swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  int partition(List<int> arr, int p, int start, int end) {
    int l = start;
    int h = end - 2;
    int piv = arr[p];
    swap(arr, p, end - 1);

    while (l < h) {
      if (arr[l] < piv) {
        l++;
      } else if (arr[h] >= piv) {
        h--;
      } else {
        swap(arr, l, h);
      }
    }
    int idx = h;
    if (arr[h] < piv) idx++;
    swap(arr, end - 1, idx);
    return idx;
  }

  Future<double> quicksort(List<int> array) async {
    final stopwatch = Stopwatch()..start();

    stopwatch.reset();
    Stack<int> stack = Stack<int>();

    stack.push(0);
    stack.push(array.length);
    while (!stack.isEmpty) {
      int end = stack.pop();
      int start = stack.pop();
      if (end - start < 2) continue;
      int p = (start + ((end - start) ~/ 2));
      p = partition(array, p, start, end);

      stack.push(p + 1);
      stack.push(end);

      stack.push(start);
      stack.push(p);
    }

    stopwatch.stop();
    print("quicksort $array");
    print(
        'quickSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
    return stopwatch.elapsed.inMicroseconds / 100000;
  }
  // Future<double> quicksort(List array, int izq, int der) async {
  //   final stopwatch = Stopwatch()..start();

  //   stopwatch.reset();

  //   equicksort(array, izq, der);

  //   stopwatch.stop();
  //   print(
  //       'quickSort() executed in ${stopwatch.elapsed.inMicroseconds / 100000}s');
  //   return stopwatch.elapsed.inMicroseconds / 100000;
  // }

  // void equicksort(List array, int leftelement, int rightelement) {
  //   int i = leftelement;
  //   int j = rightelement;
  //   int pivotelement = array[(leftelement + rightelement) ~/ 2];

  //   while (i <= j) {
  //     while (array[i] < pivotelement) {
  //       i++;
  //     }

  //     while (array[j] > pivotelement) {
  //       j--;
  //     }

  //     if (i <= j) {
  //       int objtemp = array[i];
  //       array[i] = array[j];
  //       array[j] = objtemp;
  //       i++;
  //       j--;
  //     }
  //   }

  //   if (leftelement < j) {
  //     equicksort(array, leftelement, j);
  //   }
  //   if (i < rightelement) {
  //     equicksort(array, i, rightelement);
  //   }
  // }
}
