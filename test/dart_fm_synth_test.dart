import 'package:dart_fm_synth/dart_fm_synth.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    DartFmSynth.init('build/libfmsynth.so');
    final synth = DartFmSynth(44100, 2);

    setUp(() {
      // Additional setup goes here.
    });

    test('expected lib version is returned', () {
      expect(DartFmSynth.version(), 2);
    });
  });
}
