import "package:flutter/material.dart";
import "package:maqueta_3/theme/color_scheme.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme gokuScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8d4f00),
      surfaceTint: Color(0xff8d4f00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff78f00),
      onPrimaryContainer: Color(0xff5e3300),
      secondary: Color(0xff6c5e00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffde000),
      onSecondaryContainer: Color(0xff706300),
      tertiary: Color(0xff005f77),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff007997),
      onTertiaryContainer: Color(0xffe5f6ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff201a17),
      onSurfaceVariant: Color(0xff544436),
      outline: Color(0xff877364),
      outlineVariant: Color(0xffdac2b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f2c),
      inversePrimary: Color(0xffffb875),
      primaryFixed: Color.fromARGB(255, 197, 255, 192),
      onPrimaryFixed: Color(0xff2d1600),
      primaryFixedDim: Color(0xffffb875),
      onPrimaryFixedVariant: Color(0xff6b3b00),
      secondaryFixed: Color(0xffffe326),
      onSecondaryFixed: Color(0xff211c00),
      secondaryFixedDim: Color(0xffe1c700),
      onSecondaryFixedVariant: Color(0xff514700),
      tertiaryFixed: Color(0xffb9eaff),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xff7bd2f3),
      onTertiaryFixedVariant: Color(0xff004d62),
      surfaceDim: Color(0xffe3d8d3),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf1ec),
      surfaceContainer: Color(0xfff8ebe6),
      surfaceContainerHigh: Color(0xfff2e6e0),
      surfaceContainerHighest: Color(0xffece0db),
    );
  }

  ThemeData goku() {
    return theme(gokuScheme());
  }

  static ColorScheme vegetaScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003557),
      surfaceTint: Color(0xff276291),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004c7a),
      onPrimaryContainer: Color(0xff88bcf1),
      secondary: Color(0xff6b5f00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffee300),
      onSecondaryContainer: Color(0xff716500),
      tertiary: Color(0xff412900),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5e3e00),
      onTertiaryContainer: Color(0xffd8aa65),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff41474f),
      outline: Color(0xff717880),
      outlineVariant: Color(0xffc1c7d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3135),
      inversePrimary: Color(0xff98cbff),
      primaryFixed: Color(0xffcfe5ff),
      onPrimaryFixed: Color(0xff001d33),
      primaryFixedDim: Color(0xff98cbff),
      onPrimaryFixedVariant: Color(0xff004a77),
      secondaryFixed: Color(0xfffee301),
      onSecondaryFixed: Color(0xff201c00),
      secondaryFixedDim: Color(0xffdfc700),
      onSecondaryFixedVariant: Color(0xff504700),
      tertiaryFixed: Color(0xffffddb0),
      onTertiaryFixed: Color(0xff281800),
      tertiaryFixedDim: Color(0xffefbf77),
      onTertiaryFixedVariant: Color(0xff614002),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3f9),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e8),
    );
  }

  ThemeData vegeta() {
    return theme(vegetaScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [
  ];
}