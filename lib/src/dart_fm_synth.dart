import 'dart:ffi';

class _FMSynth extends Opaque {}

typedef _FMSynthNewNative = Pointer<_FMSynth> Function(
    Float sampleRate, Uint8 maxVoices);
typedef _FMSynthNew = Pointer<_FMSynth> Function(
    double sampleRate, int maxVoices);
typedef _FMSynthFreeNative = Void Function(Pointer<_FMSynth> fm);
typedef _FMSynthFree = void Function(Pointer<_FMSynth> _fm);
typedef _FMSynthResetNative = Void Function(Pointer<_FMSynth> _fm);
typedef _FMSynthReset = void Function(Pointer<_FMSynth> _fm);

class DartFmSynth {
  static late final DynamicLibrary _lib;
  static late _FMSynthNew _new;
  static late _FMSynthFree _free;
  static late _FMSynthReset _reset;

  late Pointer<_FMSynth> _nativeInstance;

  /// Loads the libfmsynth library.
  static init(String path) {
    DynamicLibrary.open(path);
    _new = _lib.lookupFunction<_FMSynthNewNative, _FMSynthNew>('fmsynth_new');
    _free =
        _lib.lookupFunction<_FMSynthFreeNative, _FMSynthFree>('fmsynth_free');
    _reset = _lib
        .lookupFunction<_FMSynthResetNative, _FMSynthReset>('fmsynth_reset');
  }

  DartFmSynth(double sampleRate, int maxVoices) {
    _nativeInstance = _new(sampleRate, maxVoices);
  }

  void close() => _free(_nativeInstance);

  void reset() => _reset(_nativeInstance);
}