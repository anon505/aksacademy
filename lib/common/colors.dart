import 'dart:ui';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class BaseColors {
  //primary
  static Color primary50 = HexColor.fromHex('#0F172A');
  static Color primary100 = HexColor.fromHex('#D6E4FF');
  static Color primary500 = HexColor.fromHex('#3366FF');
  static Color primary600 = HexColor.fromHex('#254EDB');
  static Color primary900 = HexColor.fromHex('#091A7A');
  static Color secondary500 = HexColor.fromHex('#A855F7');
  //neutral
  static Color neutral50=HexColor.fromHex('#F8FAFC');
  static Color neutral100 = HexColor.fromHex('#F7FAFC');
  static Color neutral200 = HexColor.fromHex('#EDF2F7');
  static Color neutral300 = HexColor.fromHex('#E2E8F0');
  static Color neutral400 = HexColor.fromHex('#CBD5E0');
  static Color neutral500 = HexColor.fromHex('#A0AEC0');
  static Color neutral600 = HexColor.fromHex('#718096');
  static Color neutral700 = HexColor.fromHex('#4A5568');
  static Color neutral800 = HexColor.fromHex('#2D3748');
  static Color neutral900 = HexColor.fromHex('#1A202C');
  //danger
  static Color danger500 = HexColor.fromHex('#EE2F28');
  static Color danger50 = HexColor.fromHex('#FFF6F1');
  //original color
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color black = HexColor.fromHex('#000000');
  static Color yellow900 = HexColor.fromHex('#FFB600');
  //warning
  static Color warning200 = HexColor.fromHex('#FFFBEA');
  static Color warning400 = HexColor.fromHex('#FFCD3F');
  static Color warning500 = HexColor.fromHex('#FFB600');
  static Color warning600 = HexColor.fromHex('#DB9600');
  //info
  static Color info50 = HexColor.fromHex('#EAFEFF');
  static Color info500 = HexColor.fromHex('#00AEFF');
  //success
  static Color success100 = HexColor.fromHex('#DCFDD8');
  static Color success500 = HexColor.fromHex('#3DDB6C');
  static Color success600 = HexColor.fromHex('#5EB820');
  //facebook
  static Color facebook50 = HexColor.fromHex('#0078FF');

  //other
  static Color purple = HexColor.fromHex('#AC5DD9');
}
