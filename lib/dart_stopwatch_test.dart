library dart_stopwatch_test;

class TicksGen {
  static final Stopwatch _sw = new Stopwatch();
  static final int clockFrequency = _sw.frequency;

  int _lastTicks = 0;
  int _extraTicks = 0;

  TicksGen() {
    _sw.start();
  }

  int generate() {
    int ticks = _sw.elapsedTicks;
    int dt = ticks - _lastTicks;

    if (dt == 0) {
      // same tick, bump extra ticks counter
      ++_extraTicks;
    } else {
      _lastTicks = ticks;
      _extraTicks = 0;
    }

    return ticks + _extraTicks;    
  }  
}