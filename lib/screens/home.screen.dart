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
  final PageController _pageController = PageController(viewportFraction: 0.9);

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

  final List<String> images = [
    'https://s2-techtudo.glbimg.com/L9wb1xt7tjjL-Ocvos-Ju0tVmfc=/0x0:1200x800/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/q/l/TIdfl2SA6J16XZAy56Mw/canvaai.png',
    'https://s2-techtudo.glbimg.com/L9wb1xt7tjjL-Ocvos-Ju0tVmfc=/0x0:1200x800/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/q/l/TIdfl2SA6J16XZAy56Mw/canvaai.png',
    'https://s2-techtudo.glbimg.com/L9wb1xt7tjjL-Ocvos-Ju0tVmfc=/0x0:1200x800/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/q/l/TIdfl2SA6J16XZAy56Mw/canvaai.png',
    'https://s2-techtudo.glbimg.com/L9wb1xt7tjjL-Ocvos-Ju0tVmfc=/0x0:1200x800/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/q/l/TIdfl2SA6J16XZAy56Mw/canvaai.png',
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    
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
                height: 40,
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
                              SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  'ir agora',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: AppFontWeight.semiBold,
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
                padding: EdgeInsets.only(bottom: 5),
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'zona norte'.toLowerCase(),
                      style: TextStyle(
                        fontSize: 13,
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
                        AppIcons.arrowDownWhiteIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
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
                      padding: EdgeInsets.symmetric(vertical: 13),
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
                          return Container(
                            margin: EdgeInsets.only(top: 17),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  margin: EdgeInsets.only(bottom: 22),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(40),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            child: Image.network(
                                              'https://cf.bstatic.com/xdata/images/hotel/max1024x768/559777818.jpg?k=f972deb0673962ad4628773dbb3f6465770734a64130e4ddc56dbc38d2376999&o=&hp=1',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: screenWidth - 140,
                                            child: Stack(
                                              children: [
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    'hotel estrela da água'.toLowerCase(),
                                                    style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight: AppFontWeight.regular,
                                                      color: AppColors.text,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Container(
                                                    width: 30,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(51, 239, 241, 240),
                                                          AppColors.background,
                                                          AppColors.background,
                                                        ],
                                                        stops: [0, 0.6, 1.0],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              'santana - são paulo'.toLowerCase(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: AppFontWeight.regular,
                                                color: AppColors.text,
                                                height: 1
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(3, 1, 5, 0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColors.yellow,
                                                    width: 1
                                                  ),
                                                  borderRadius: BorderRadius.circular(7)
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: AppColors.yellow,
                                                      size: 16,
                                                    ),
                                                    SizedBox(width: 2),
                                                    Text(
                                                      '4.6',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: AppFontWeight.semiBold,
                                                        color: AppColors.text,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '200 avalizações',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: AppFontWeight.semiBold,
                                                      color: AppColors.text,
                                                    ),
                                                  ),
                                                  SizedBox(width: 6),
                                                  Container(
                                                    width: 8,
                                                    height: 8,
                                                    margin: EdgeInsets.only(top: 5),
                                                    child: SvgPicture.asset(
                                                      AppIcons.arrowDownGrayIcon,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                        child: Icon(
                                          Icons.favorite,
                                          color: false ? AppColors.primary : AppColors.secoundary900,
                                          size: 32.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 700,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    itemCount: images.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: index == (images.length - 1) ? EdgeInsets.only(right: 0) : EdgeInsets.only(right: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.circular(40),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(10, 0, 0, 0),
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(8, 8, 8, 22),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(8),
                                                        child: Container(
                                                          height: 225,
                                                          width: double.infinity,
                                                          child: Image.network(
                                                            images[index],
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 18),
                                                      Text(
                                                        'suíte standard'.toLowerCase(),
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight: AppFontWeight.regular,
                                                          color: AppColors.text,
                                                          height: 1.3,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(bottom: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.circular(40),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(10, 0, 0, 0),
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(8, 20, 8, 22),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        margin: EdgeInsets.only(right: 13),
                                                        decoration: BoxDecoration(
                                                          color: AppColors.background,
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.network(
                                                              'https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        margin: EdgeInsets.only(right: 13),
                                                        decoration: BoxDecoration(
                                                          color: AppColors.background,
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.network(
                                                              'https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        margin: EdgeInsets.only(right: 13),
                                                        decoration: BoxDecoration(
                                                          color: AppColors.background,
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.network(
                                                              'https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        margin: EdgeInsets.only(right: 13),
                                                        decoration: BoxDecoration(
                                                          color: AppColors.background,
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.network(
                                                              'https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'ver \n todos',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: AppFontWeight.semiBold,
                                                              color: AppColors.secoundary50,
                                                            ),
                                                            textAlign: TextAlign.right,
                                                          ),
                                                          SizedBox(width: 10),
                                                          SizedBox(
                                                            width: 10,
                                                            height: 10,
                                                            child: SvgPicture.asset(
                                                              AppIcons.arrowDownGrayLightIcon,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              )
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(bottom: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.circular(40),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(10, 0, 0, 0),
                                                    spreadRadius: 2,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(25, 20, 20, 20),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '3 horas',
                                                            style: TextStyle(
                                                              fontSize: 26,
                                                              fontWeight: AppFontWeight.regular,
                                                              color: AppColors.text,
                                                            ),
                                                          ),
                                                          Text(
                                                            'R\$ 78,88',
                                                            style: TextStyle(
                                                              fontSize: 26,
                                                              fontWeight: AppFontWeight.regular,
                                                              color: AppColors.text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: SvgPicture.asset(
                                                          AppIcons.arrowRightGrayIcon,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              )
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
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
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(30, 0, 0, 0),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(40),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_outlined,
                    color: AppColors.primary,
                    size: 18,
                  ),
                  SizedBox(width: 3),
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: Text(
                      'mapa',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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