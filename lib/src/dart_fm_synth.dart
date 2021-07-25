import 'dart:ffi';

import 'package:ffi/ffi.dart';

class _FMSynth extends Opaque {}

typedef _FMSynthNewNative = Pointer<_FMSynth> Function(
    Float sampleRate, Uint8 maxVoices);
typedef _FMSynthNew = Pointer<_FMSynth> Function(
    double sampleRate, int maxVoices);
typedef _FMSynthFreeNative = Void Function(Pointer<_FMSynth> fm);
typedef _FMSynthFree = void Function(Pointer<_FMSynth> _fm);
typedef _FMSynthResetNative = Void Function(Pointer<_FMSynth> _fm);
typedef _FMSynthReset = void Function(Pointer<_FMSynth> _fm);
typedef _FMSynthVersionNative = Int8 Function();
typedef _FMSynthVersion = int Function();
typedef _FMSynthSetParameterNative = Void Function(
    Pointer<_FMSynth> _fm, Uint8 parameter, Uint8 operatorIndex, Float value);
typedef _FMSynthSetParameter = void Function(
    Pointer<_FMSynth> _fm, int parameter, int operatorIndex, double value);
typedef _FMSynthRenderNative = Uint8 Function(Pointer<_FMSynth> _fm,
    Pointer<Float> left, Pointer<Float> right, Uint8 frames);
typedef _FMSynthRender = int Function(Pointer<_FMSynth> _fm,
    Pointer<Float> left, Pointer<Float> right, int frames);

class DartFmSynth {
  static late final DynamicLibrary _lib;

  static late _FMSynthVersion _version;

  static late _FMSynthNew _new;
  static late _FMSynthFree _free;
  static late _FMSynthReset _reset;
  static late _FMSynthSetParameter _setParameter;
  static late _FMSynthRender _render;

  late Pointer<_FMSynth> _nativeInstance;
  int _activeVoices = 0;

  int get activeVoices => _activeVoices;

  /// Loads the libfmsynth library.
  static init(String path) {
    _lib = DynamicLibrary.open(path);
    _new = _lib.lookupFunction<_FMSynthNewNative, _FMSynthNew>('fmsynth_new');
    _free =
        _lib.lookupFunction<_FMSynthFreeNative, _FMSynthFree>('fmsynth_free');
    _reset = _lib
        .lookupFunction<_FMSynthResetNative, _FMSynthReset>('fmsynth_reset');
    _version = _lib.lookupFunction<_FMSynthVersionNative, _FMSynthVersion>(
        'fmsynth_get_version');
    _setParameter =
        _lib.lookupFunction<_FMSynthSetParameterNative, _FMSynthSetParameter>(
            'fmsynth_set_parameter');
    _render = _lib
        .lookupFunction<_FMSynthRenderNative, _FMSynthRender>('fmsynth_render');
  }

  static int version() => _version();

  DartFmSynth(double sampleRate, int maxVoices) {
    _nativeInstance = _new(sampleRate, maxVoices);
  }

  void close() => _free(_nativeInstance);

  void reset() => _reset(_nativeInstance);

  void setParameter(int parameter, int operatorIndex, double value) =>
      _setParameter(_nativeInstance, parameter, operatorIndex, value);

  StereoBuffer render(int frames) {
    final leftBuffer = calloc<Float>(frames);
    final rightBuffer = calloc<Float>(frames);
    _activeVoices = _render(
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
