import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons.constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              AppIcons.menuIcon,
            ),
          ),
          onPressed: () {},
        ),
        title: Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(44),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 350,
                minWidth: 240,
              ),
              child: Container(
                height: 44,
                color: AppColors.primary900,
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(44),
                        child: Container(
                          height: 44,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          color: AppColors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: SvgPicture.asset(
                                  AppIcons.flashIcon,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  'ir agora',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: AppFontWeight.bold,
                                    color: AppColors.text,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(44),
                        child: Container(
                          height: 44,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 18,
                                height: 18,
                                child: SvgPicture.asset(
                                  AppIcons.calendarIcon,
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  'ir outro dia',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: AppFontWeight.semiBold,
                                    color: AppColors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Container(
              width: 19,
              height: 19,
              child: SvgPicture.asset(
                AppIcons.searchIcon,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomPaint(
              painter: DashedBorderPainter(),
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'zona norte',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: AppFontWeight.semiBold,
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.only(top: 4),
                      child: SvgPicture.asset(
                        AppIcons.arrowDownIcon,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
    ..color = AppColors.white
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;

    const double dashWidth = 4, dashSpace = 4;
    double startX = 0;
    double y = size.height;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}