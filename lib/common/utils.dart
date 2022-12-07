import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

String getMemberAreaRoute(String caption) {
  return '/${caption.replaceAll(" ", "-").toLowerCase()}';
}

String getDateFormatted(String date, String format) {
  print('DATE: $date');
  if (date.isEmpty) {
    return '';
  }
  DateTime dTime = DateTime.parse(date);
  final DateFormat formatter = DateFormat(format);
  final String formatted = formatter.format(dTime);
  return formatted;
}

int getMonth(String date) {
  DateTime dTime = DateTime.parse(date);
  return dTime.month;
}

int getYear(String date) {
  DateTime dTime = DateTime.parse(date);
  return dTime.year;
}

int getDaysInMonth(int currentMonth, int currentYear) {
  return DateUtils.getDaysInMonth(currentYear, currentMonth);
}

String lorem() {
  return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras pellentesque ex urna, ac aliquam dolor accumsan eu. Donec tincidunt consequat sagittis. Nam tempus nisi sit amet lacus fermentum, a aliquam mauris ultrices. Quisque lacinia sed ipsum vel malesuada. Phasellus eros velit, bibendum nec nibh in, tincidunt dapibus est.\n\nDuis ex purus, finibus sed convallis non, tincidunt at erat. Nullam nec vulputate est.\n\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec porttitor dui, ac laoreet dui. Integer tincidunt a nulla et consequat. Suspendisse potenti. Mauris urna dolor, dapibus semper malesuada et, facilisis sed erat. Cras laoreet risus tristique quam pulvinar egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget mattis tortor.\n\nras interdum lacinia nulla, a tempus mi faucibus consectetur. Curabitur et fringilla eros, nec accumsan lorem. Integer volutpat, ligula a sollicitudin auctor, sem arcu accumsan metus, ut sagittis mauris ante at diam. Quisque quis ornare quam, quis iaculis sem. Nullam purus ipsum, accumsan eget cursus sed, lacinia sed felis. Vivamus vestibulum auctor molestie. Sed enim urna, tempus a dolor quis, faucibus dapibus lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. ';
}

String loremShort() {
  return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras pellentesque ex urna, ac aliquam dolor accumsan eu. Donec tincidunt consequat sagittis. Nam tempus nisi sit amet lacus fermentum, a aliquam mauris ultrices. Quisque lacinia sed ipsum vel malesuada. Phasellus eros velit, bibendum nec nibh in, tincidunt dapibus est.\n\nDuis ex purus, finibus sed convallis non, tincidunt at erat. Nullam nec vulputate est.\n\nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec porttitor dui, ac laoreet dui. Integer tincidunt a nulla et consequat. Suspendisse potenti. Mauris urna dolor, dapibus semper malesuada et, facilisis sed erat. Cras laoreet risus tristique quam pulvinar egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget mattis tortor.';
}

String loremHtml() {
  return '''<div id="lipsum">
<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer auctor mauris sit amet ante viverra interdum. Pellentesque dapibus elit ut interdum commodo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In scelerisque nunc vel massa euismod tristique. Nam sed urna tincidunt, accumsan risus vitae, euismod nunc. Ut eu luctus ligula, sed convallis urna. Nulla eu finibus libero, id sollicitudin odio. Praesent nec sem maximus, faucibus libero eu, faucibus lorem.
</p>
<p>
Nullam euismod nisl at tempor sollicitudin. Quisque ultrices enim sed tellus lobortis scelerisque. Etiam tincidunt lectus eget turpis facilisis, vel tincidunt dui semper. Praesent mi nisl, volutpat vel scelerisque sit amet, hendrerit eu sem. Vivamus vel neque at nisi facilisis efficitur et non neque. Aenean facilisis commodo elit a sagittis. Aenean et sodales diam. Aliquam tristique auctor purus. Nam id euismod est. Donec vehicula convallis fermentum. Nunc eleifend lectus lacus, nec varius diam pellentesque sit amet. Praesent orci diam, elementum non est et, convallis dapibus enim.
</p>
<p>
Nullam rhoncus lacus vitae nibh interdum semper. Morbi ornare convallis mi, non sollicitudin neque pellentesque eget. Mauris eu laoreet est, sit amet porta nunc. Nunc sit amet tortor leo. Vivamus scelerisque magna nec tellus bibendum, vel aliquam tellus consequat. Donec volutpat vulputate velit, vel finibus libero porttitor sed. Cras hendrerit consequat sagittis. Nullam condimentum ornare nibh id tempor. Donec in vehicula sapien. Fusce auctor dui in imperdiet varius. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum condimentum placerat fringilla. Nulla nisi augue, tincidunt ac dapibus et, finibus ac lacus. Quisque leo massa, mollis at nulla quis, tincidunt ullamcorper augue.
</p>
<p>
Nam aliquam libero ante, ac hendrerit felis tincidunt sit amet. Nam quis neque a justo finibus molestie. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras sodales mauris quam, eget rhoncus dolor tristique at. Nulla eleifend lacus egestas, finibus nisl et, mollis tortor. Curabitur venenatis consequat finibus. Sed imperdiet, nunc nec rhoncus rutrum, sapien nisl sodales dui, ut faucibus quam sapien id dui. Etiam dolor leo, mattis eget facilisis ac, commodo vitae metus. Morbi posuere magna vitae molestie hendrerit. Sed semper tellus in orci consequat, sit amet aliquam nibh scelerisque. Nunc sollicitudin sed tortor at volutpat. Vestibulum nibh ex, viverra et pretium eu, tempus vitae felis. Donec venenatis, metus in tristique volutpat, lectus nisl venenatis massa, sed commodo nulla odio eget mauris.
</p>
<p>
Curabitur libero tellus, consequat ac purus sit amet, aliquet vehicula felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras ut porttitor risus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla quis pretium urna, at tincidunt lacus. Aliquam interdum mauris id augue aliquam placerat. Vestibulum cursus eros neque, ac aliquet neque gravida id. Donec vulputate elit a congue vestibulum. Morbi tempus lacinia tortor, eu faucibus eros condimentum at. Sed euismod tortor non velit finibus, id volutpat quam finibus. Sed vel lectus mattis, malesuada dolor sed, finibus sapien.
</p></div>''';
}

String loremHtmlShort() {
  return '''<div id="lipsum">
<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer auctor mauris sit amet ante viverra interdum. Pellentesque dapibus elit ut interdum commodo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In scelerisque nunc vel massa euismod tristique. Nam sed urna tincidunt, accumsan risus vitae, euismod nunc. Ut eu luctus ligula, sed convallis urna. Nulla eu finibus libero, id sollicitudin odio. Praesent nec sem maximus, faucibus libero eu, faucibus lorem.
</p>
<p>
Nullam euismod nisl at tempor sollicitudin. Quisque ultrices enim sed tellus lobortis scelerisque. Etiam tincidunt lectus eget turpis facilisis, vel tincidunt dui semper. Praesent mi nisl, volutpat vel scelerisque sit amet, hendrerit eu sem. Vivamus vel neque at nisi facilisis efficitur et non neque. Aenean facilisis commodo elit a sagittis. Aenean et sodales diam. Aliquam tristique auctor purus. Nam id euismod est. Donec vehicula convallis fermentum. Nunc eleifend lectus lacus, nec varius diam pellentesque sit amet. Praesent orci diam, elementum non est et, convallis dapibus enim.
</p>
<p>
Nullam rhoncus lacus vitae nibh interdum semper. Morbi ornare convallis mi, non sollicitudin neque pellentesque eget. Mauris eu laoreet est, sit amet porta nunc. Nunc sit amet tortor leo. Vivamus scelerisque magna nec tellus bibendum, vel aliquam tellus consequat. Donec volutpat vulputate velit, vel finibus libero porttitor sed. Cras hendrerit consequat sagittis. Nullam condimentum ornare nibh id tempor. Donec in vehicula sapien. Fusce auctor dui in imperdiet varius. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum condimentum placerat fringilla. Nulla nisi augue, tincidunt ac dapibus et, finibus ac lacus. Quisque leo massa, mollis at nulla quis, tincidunt ullamcorper augue.
</p>
</div>''';
}

String getRandomImage(int size) {
  Random random = Random();
  return 'https://source.unsplash.com/random/${size}x${size}?sig=${random.nextInt(3) + 1}';
}

String getRandomImageWidthHeigh(int width, int height) {
  Random random = Random();
  return 'https://source.unsplash.com/random/${width}x${height}?sig=${random.nextInt(3) + 1}';
}

String getRandomPersonImage() {
  Random random = Random();
  return 'https://randomuser.me/api/portraits/men/${random.nextInt(70)}.jpg';
}

String printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

String formattedPhoneNumber(String phone) {
  String phoneNumber = '+$phone';
  var pre = [
    phoneNumber.substring(0, 3),
    phoneNumber.substring(3, 6),
    phoneNumber.substring(6, 10),
    phoneNumber.substring(10),
  ];
  String formattedPhone = "";
  for (var element in pre) {
    formattedPhone = "$formattedPhone$element ";
  }
  return formattedPhone;
}

String formattedPrice(String price) {
  final formatter = NumberFormat("#,##0", "id_ID");
  String text = getNumberFromPrice(price);
  return formatter.format(int.tryParse(text));
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Selamat Pagi ⛅';
  }
  if (hour < 17) {
    return 'Selamat Siang ⛅';
  }
  return 'Selamat Malam ⛅';
}

String getNumberFromPrice(String price) {
  String text = '';
  price.split('.').forEach(
        (element) => text = text + element,
      );
  return text;
}
