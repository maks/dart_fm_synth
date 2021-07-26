import 'dart:io';

import 'package:dart_fm_synth/dart_fm_synth.dart';

void main(List<String> args) {
  DartFmSynth.init('build/libfmsynth.so');
  print('libfmsynth version: ${DartFmSynth.version()}');
  final fmsynth = DartFmSynth(44100, 4);

  for (int i = 0; i < 8; i++) {
    fmsynth.setParameter(
        fmsynth_parameter.FMSYNTH_PARAM_MOD_TO_CARRIERS0 + i, (i + 1) & 7, 2.0);
    fmsynth.setParameter(fmsynth_parameter.FMSYNTH_PARAM_FREQ_MOD, i, i + 1.0);
    fmsynth.setParameter(
        fmsynth_parameter.FMSYNTH_PARAM_PAN, i, (i == 1) ? -0.5 : 0.5);
    fmsynth.setParameter(fmsynth_parameter.FMSYNTH_PARAM_CARRIERS, i, 1.0);
    fmsynth.setParameter(
        fmsynth_parameter.FMSYNTH_PARAM_LFO_FREQ_MOD_DEPTH, i, 0.15);
  }

  for (int i = 0; i < 64; i++) {
    fmsynth.noteOn(i + 20, 127);
  }

  final file = File('output.txt');
  final b = StringBuffer();
  for (int i = 0; i < 10; i++) {
    final renderedSamples = fmsynth.render(2048);

    for (int x = 0; x < 2048; x++) {
      b.writeln('${renderedSamples.left[x]} ${renderedSamples.right[x]}');
    }
  }
  file.writeAsStringSync(b.toString());

  fmsynth.close();
}
