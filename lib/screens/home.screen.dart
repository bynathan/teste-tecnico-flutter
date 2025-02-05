import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons.constants.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_technical_test_motel_list/core/models/filter.model.dart';
import 'package:flutter_technical_test_motel_list/widgets/filter.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Filter> filterList = [
    Filter(id: 0, name: 'filtros'),
    Filter(id: 1, name: 'com desconto'),
    Filter(id: 2, name: 'disponíveis'),
    Filter(id: 3, name: 'hidro'),
    Filter(id: 4, name: 'piscina'),
    Filter(id: 5, name: 'sauna'),
    Filter(id: 6, name: 'ofurô'),
    Filter(id: 7, name: 'decoração erótica'),
    Filter(id: 8, name: 'decoração temática'),
    Filter(id: 9, name: 'cadeira erótica'),
    Filter(id: 10, name: 'pista de dança'),
    Filter(id: 11, name: 'garagem privativa'),
    Filter(id: 12, name: 'frigobar'),
    Filter(id: 13, name: 'internet wi-fi'),
    Filter(id: 13, name: 'suíte para festas'),
    Filter(id: 13, name: 'suíte com acessibilidade'),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    
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
                maxWidth: 300,
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
                padding: EdgeInsets.only(bottom: 6),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight - 155,
            margin: EdgeInsets.only(top: 22),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(height: 200, width: 200, color: Colors.orange),
                ),
                SliverStickyHeader(
                  header: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: AppColors.secoundary
                        )
                      )
                    ),
                    child: SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filterList.length,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          final filter = filterList[index];
                          return FilterItemWidget(
                            index: index,
                            filter: filter,
                            onPressed: () {
                              setState(() {
                                filter.isSelected = !filter.isSelected;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Text(
                            'teste ${index + 1}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        );
                      },
                      childCount: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
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