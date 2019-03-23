import 'package:dart_stopwatch_test/dart_stopwatch_test.dart';


const N = 10000;

main(List<String> arguments) {
  var gen = new TicksGen();
  var ticks = new List<int>(N);

  // generate
  for (int i = 0; i < N; i++) {
    ticks[i] = gen.generate();
  }

  // check
  var prev = ticks[0];
  print("0000: $prev");
  for (int i = 1; i < N; i++) {
    print("${i.toString().padLeft(4, '0')}: ${ticks[i]}");
    if (prev >= ticks[i]) {
      print("$prev !<  ${ticks[i]}");
      return;
    }
    prev = ticks[i];
  }

  print(TicksGen.clockFrequency);  
}
