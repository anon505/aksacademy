import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// Custom theme sesuai design figma.
  ///
  /// Contoh penggunaan : [AppTheme.appTextTheme.smallsmallNormalMedium]
  /// Menambahkan custom color : [AppTheme.appTextTheme.smallNormalMedium.copyWith(color: Colors.amber)]

  static const AppTextTheme appTextTheme = AppTextTheme();
}

/// Kumpulan Custom TextStyle
///
class AppTextTheme {
  const AppTextTheme({TextStyle? small});

// Large
  TextStyle? get extraLargeNormalBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
      );
  // Large
  TextStyle? get largeNormalBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );
  TextStyle? get largeNormalMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle? get largeTightMedium => const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 2.0,
  );
  TextStyle? get largeTightBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 2.0,
      );

  // Reguler
  TextStyle? get regulerNoneReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
  TextStyle? get regulerNormalReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 2.4,
      );
  TextStyle? get regulerNormalMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 2.4,
      );
  TextStyle? get regulerNormalBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 2.4,
      );
  TextStyle? get regulerTightBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 2.0,
      );
  TextStyle? get regulerNormalRegular => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 2.4,
      );
  TextStyle? get regulerTightMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 2.0,
      );
  TextStyle? get regulerNoneMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  TextStyle? get regulerNoneBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      );

  // Small
  TextStyle? get smallNormalBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
      );

  TextStyle? get smallNormalMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  TextStyle? get smallNormalReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  TextStyle? get smallTightReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.6,
      );
  TextStyle? get xSmallTightReguler => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.6,
  );
  TextStyle? get smallTightMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.6,
      );
  TextStyle? get smallTightBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.6,
      );

  TextStyle? get smallNoneReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.4,
      );
  TextStyle? get smallNoneMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.4,
      );
  TextStyle? get smallNonBold => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.4,
      );
  // Tiny
  TextStyle? get tinyNoneMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.2,
      );
  TextStyle? get tinyNormalReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.6,
      );
  TextStyle? get tinyTightReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.4,
      );
  TextStyle? get tinyNoneReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.2,
      );
  TextStyle? get tinyNormalMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  // xTiny
  TextStyle? get xTinyNoneReguler => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.2,
      );
  TextStyle? get xSmallNormalReguler => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.2,
  );

  TextStyle? get largeNoneBold => const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.2,
  );
}
