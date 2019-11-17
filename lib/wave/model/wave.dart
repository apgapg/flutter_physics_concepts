import 'dart:ui';

class Wave {
  double amplitude;
  final double wavelength;
  final double frequency;
  double phase;
  Color color;
  final String title;
  final String description;
  bool forward;
  double width;

  Wave({
    this.title,
    this.description,
    this.amplitude,
    this.wavelength,
    this.frequency,
    this.phase,
    this.color,
    this.forward = true,
    this.width = 4,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "Wave: A:$amplitude, λ:$wavelength, f:$frequency, Φ:$phase";
  }

  Wave copyWith({
    double amplitude,
    double phase,
    Color color,
    bool forward,
    double width,
    double frequency,
    double wavelength,
  }) {
    return Wave(
      title: title,
      description: description,
      wavelength: wavelength ?? this.wavelength,
      frequency: frequency ?? this.frequency,
      color: color ?? this.color,
      forward: forward ?? this.forward,
      amplitude: amplitude ?? this.amplitude,
      phase: phase ?? this.phase,
      width: width ?? this.width,
    );
  }
}
