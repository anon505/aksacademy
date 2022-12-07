import 'package:aksacademy/common/app_theme.dart';
import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/presentation/component/common/app_navbar.dart';
import 'package:aksacademy/presentation/component/common/button.dart';
import 'package:aksacademy/presentation/component/common/ticket_separator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketDetailPage extends StatefulWidget {
  static const routeName='ticket_detail_page';
  const TicketDetailPage({Key? key, }) : super(key: key);
  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _ClipShadowPainter extends CustomPainter {
  const _ClipShadowPainter({
    required this.clipper,
    required this.boxShadows, required List<BoxShadow> clipShadow,
  });

  final CustomClipper<Path> clipper;
  final List<BoxShadow> boxShadows;

  @override
  void paint(Canvas canvas, Size size) {
    for (final shadow in boxShadows) {
      final spreadSize = Size(
        size.width + shadow.spreadRadius * 2,
        size.height + shadow.spreadRadius * 2,
      );
      final clipPath = clipper.getClip(spreadSize).shift(
        Offset(
          shadow.offset.dx - shadow.spreadRadius,
          shadow.offset.dy - shadow.spreadRadius,
        ),
      );
      final paint = shadow.toPaint();
      canvas.drawPath(clipPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow extends StatelessWidget {
  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> boxShadow;

  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// The [Widget] below this widget in the tree.
  final Widget child;

  ClipShadow({
    required this.boxShadow,
    required this.clipper,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(
          clipShadow: boxShadow,
          clipper: clipper, boxShadows: []
      ),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
class Ticket extends StatelessWidget {
  const Ticket({
    Key? key,
    this.innerRadius = const BorderRadius.all(Radius.circular(0.0)),
    this.outerRadius = const BorderRadius.all(Radius.circular(0.0)),
    required this.child,
    this.boxShadow = const [],
    this.dashedBottom = false
  }) : super(key: key);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  final List<BoxShadow> boxShadow;

  // TODO: custom border styles
  final bool dashedBottom;

  /// The [child] contained by the ticket widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: _TicketClipper(innerRadius, outerRadius),
      boxShadow: boxShadow,
      child: child,
    );
  }
}

class _TicketClipper extends CustomClipper<Path> {
  _TicketClipper(this.innerRadius, this.outerRadius);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  @override
  Path getClip(Size size) {
    /// approximation to a circular arc
    const C = 0.551915024494;
    final path = Path();

    var currentUseInner = false;
    var currentRadius = const Radius.circular(0.0);

    currentUseInner = innerRadius.topLeft != const Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.topLeft : outerRadius.topLeft;
    path.moveTo(0.0, currentRadius.y);
    path.cubicTo(
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentRadius.x, 0.0);

    currentUseInner = innerRadius.topRight != const Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.topRight : outerRadius.topRight;
    path.lineTo(size.width - currentRadius.x, 0.0);
    path.cubicTo(
        currentUseInner ? size.width - currentRadius.x : size.width - currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        size.width, currentRadius.y);

    currentUseInner = innerRadius.bottomRight != const Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.bottomRight : outerRadius.bottomRight;
    path.lineTo(size.width, size.height - currentRadius.y);
    path.cubicTo(
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner ? size.height - currentRadius.y : size.height - currentRadius.y * (1 - C),
        currentUseInner ? size.width - currentRadius.x : size.width - currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        size.width - currentRadius.x, size.height);

    currentUseInner = innerRadius.bottomLeft != const Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.bottomLeft : outerRadius.bottomLeft;
    path.lineTo(currentRadius.x, size.height);
    path.cubicTo(
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner ? size.height - currentRadius.y : size.height - currentRadius.y * (1 - C),
        0.0, size.height - currentRadius.y);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
class _TicketDetailPageState extends State<TicketDetailPage> {
  double _heightTicket=0;
  double _widthTicket=0;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              HexColor.fromHex('#30CFD0'),
              HexColor.fromHex('#330867'),
            ],
            begin: Alignment.topLeft,
            end: const Alignment(0.8, 1),
            tileMode: TileMode.mirror),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppNavBar(
          backColor: Colors.transparent,
          foreColor: BaseColors.white,
          leadingView: InkWell(
            child: const Icon(Iconsax.arrow_left),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            InkWell(
              child: const Icon(Iconsax.share),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 12,),
          ],
        ),
        body: SingleChildScrollView(child:Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Ticket(
                innerRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                ),
                outerRadius: const BorderRadius.all(Radius.circular(18)),
                child: Container(
                  decoration: BoxDecoration(
                    color: BaseColors.white
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/dummies/ic_tutorial_1.png',
                        )
                      ),
                      const SizedBox(height: 9,),
                      Text('Design Event',style: AppTheme.appTextTheme.xSmallNormalReguler
                          ?.copyWith(height: 0,color: BaseColors.neutral900)),
                      const SizedBox(height: 8,),
                      Text('Refactoring UI',style: AppTheme.appTextTheme.largeNoneBold
                          ?.copyWith(height: 0,color: BaseColors.neutral900)),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              Container(
                color: BaseColors.white,
                height: 1,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: TicketSeparator(
                  dashWidth: 8,
                  color: BaseColors.neutral600,
                ),
              ),
              Ticket(
                innerRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                outerRadius: const BorderRadius.all(Radius.circular(18)),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 14,right: 14,top: 19,bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Nama Peserta',style: AppTheme.appTextTheme.xSmallNormalReguler
                        ?.copyWith(height: 0,color: BaseColors.neutral500),),
                      SizedBox(height: 4,),
                      Text('Memed Miftachul',style: AppTheme.appTextTheme.smallNormalMedium
                          ?.copyWith(height: 0,color: BaseColors.neutral900),),
                      SizedBox(height: 12,),
                      Text('No Telepon',style: AppTheme.appTextTheme.xSmallNormalReguler
                          ?.copyWith(height: 0,color: BaseColors.neutral500),),
                      SizedBox(height: 4,),
                      Text('+62 3232 3232 3232',style: AppTheme.appTextTheme.smallNormalMedium
                          ?.copyWith(height: 0,color: BaseColors.neutral900),),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Expanded(child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text('Tanggal',style: AppTheme.appTextTheme.xSmallNormalReguler
                                  ?.copyWith(height: 0,color: BaseColors.neutral500),),
                              SizedBox(height: 4,),
                              Text('23 Desmber 2022',style: AppTheme.appTextTheme.smallNormalMedium
                                  ?.copyWith(height: 0,color: BaseColors.neutral900),),
                            ],
                          )),
                          Expanded(child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text('Waktu',style: AppTheme.appTextTheme.xSmallNormalReguler
                                  ?.copyWith(height: 0,color: BaseColors.neutral500),),
                              SizedBox(height: 4,),
                              Text('12:00 AM',style: AppTheme.appTextTheme.smallNormalMedium
                                  ?.copyWith(height: 0,color: BaseColors.neutral900),),
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: BaseColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: TicketSeparator(
                  dashWidth: 8,
                  color: BaseColors.neutral600,
                ),
              ),
              Ticket(
                innerRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                outerRadius: const BorderRadius.all(Radius.circular(18)),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/dummies/ic_ticket_barcode.png'),
                      SizedBox(height: 19,),
                      Button(
                        listener: (){
                          Navigator.pushNamed(context, TicketDetailPage.routeName);
                        },
                        height: 48,
                        borderRadius: 12,
                        buttonType: ButtonType.solid,
                        backgroundColor: BaseColors.neutral900,
                        captionColor: BaseColors.white,
                        caption: 'Download',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),),
      ),
    );
  }
}
