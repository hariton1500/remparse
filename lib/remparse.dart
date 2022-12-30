import 'dart:io';

void calculate() {
  print('start parsing');
  List<String> file = File('bin/in.txt').readAsLinesSync();
  bool nextLineIsRepair = false;
  for (var line in file) {
    //print('checking line: $line');
    if (line.startsWith('Дата	Суток')) {
      nextLineIsRepair = true;
    }
    if (line.startsWith('Всего:')) {
      nextLineIsRepair = false;
    }
    if (nextLineIsRepair && !line.startsWith('Дата	Суток')) {
      parse(line);
    }
  }

}

void parse(String line) {
  print('parsing repair line: $line');
  print(line.split('	').map((e) => '$e\n').toList());
}
