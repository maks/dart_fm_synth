import 'package:dart_fm_synth/dart_fm_synth.dart';

void main() {
  DartFmSynth.init('build/libfmsynth.so');
  final synth = DartFmSynth(44100, 4);
  print('libfmsynth version: ${DartFmSynth.version()}');
}
