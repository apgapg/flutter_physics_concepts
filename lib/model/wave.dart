import 'dart:ui';

class Wave {
  final double amplitude;
  final double wavelength;
  final double frequency;
  double phase;
  Color color;
  final String title;
  final String description;
  final bool forward;

  Wave({
    this.title,
    this.description,
    this.amplitude,
    this.wavelength,
    this.frequency,
    this.phase,
    this.color,
    this.forward = true,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "Wave: A:$amplitude, λ:$wavelength, f:$frequency, Φ:$phase";
  }
}
