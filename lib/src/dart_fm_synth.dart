import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../libfmsynth_generated_bindings.dart';

export '../libfmsynth_generated_bindings.dart' show fmsynth_parameter;

class DartFmSynth {
  late Pointer<fmsynth> _nativeInstance;
  int _activeVoices = 0;

  int get activeVoices => _activeVoices;
  static late libfmsynth _lib;

  /// Loads the libfmsynth library.
  static void init(String path) {
    _lib = libfmsynth(DynamicLibrary.open(path));
  }

  static int version() => _lib.fmsynth_get_version();

  DartFmSynth(double sampleRate, int maxVoices) {
    _nativeInstance = _lib.fmsynth_new(sampleRate, maxVoices);
  }

  void close() => _lib.fmsynth_free(_nativeInstance);

  void reset() => _lib.fmsynth_reset(_nativeInstance);

  void setParameter(int parameter, int operatorIndex, double value) => _lib
      .fmsynth_set_parameter(_nativeInstance, parameter, operatorIndex, value);

  void noteOn(int note, int velocity) =>
      _lib.fmsynth_note_on(_nativeInstance, note, velocity);

  StereoBuffer render(int frames) {
    final leftBuffer = calloc<Float>(frames);
    final rightBuffer = calloc<Float>(frames);
    _activeVoices = _lib.fmsynth_render(
      _nativeInstance,
      leftBuffer,
      rightBuffer,
      frames,
    );
    final buffer = StereoBuffer(
      List.from(leftBuffer.asTypedList(frames)),
      List.from(rightBuffer.asTypedList(frames)),
    );
    calloc.free(leftBuffer);
    calloc.free(rightBuffer);
    return buffer;
  }
}

class StereoBuffer {
  final List<double> left;
  final List<double> right;

  StereoBuffer(this.left, this.right);
}
