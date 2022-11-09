import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension styleExt on TextStyle {
  TextStyle get size10 => this.copyWith(fontSize: 10);

  TextStyle get size12 => this.copyWith(fontSize: 12);

  TextStyle get size14 => this.copyWith(fontSize: 14);

  TextStyle get size15 => this.copyWith(fontSize: 15);

  TextStyle get size16 => this.copyWith(fontSize: 16);

  TextStyle get size17 => this.copyWith(fontSize: 17);

  TextStyle get size18 => this.copyWith(fontSize: 18);

  TextStyle get size19 => this.copyWith(fontSize: 19);

  TextStyle get size20 => this.copyWith(fontSize: 20);

  TextStyle get size21 => this.copyWith(fontSize: 21);

  TextStyle get size22 => this.copyWith(fontSize: 22);

  TextStyle get size23 => this.copyWith(fontSize: 23);

  TextStyle get size24 => this.copyWith(fontSize: 24);

  TextStyle get size25 => this.copyWith(fontSize: 25);

  TextStyle get size26 => this.copyWith(fontSize: 26);

  TextStyle get size28 => this.copyWith(fontSize: 28);

  TextStyle get size32 => this.copyWith(fontSize: 32);

  TextStyle get size30 => this.copyWith(fontSize: 30);

  TextStyle get size36 => this.copyWith(fontSize: 36);

  TextStyle get colorWhite => this.copyWith(color: Colors.white);

  TextStyle withHeight(double x) => this.copyWith(height: x);

  TextStyle get italic => this.copyWith(fontStyle: FontStyle.italic);
}

final w400 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal);

final w500 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal);

final w600 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal);

final w800 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.normal);

final grey600 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic);

final grey600Normal = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal);

final w700 = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal);
