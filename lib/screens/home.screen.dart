// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons.constants.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_technical_test_motel_list/core/models/motel.model.dart';
import 'package:flutter_technical_test_motel_list/core/models/promotion.model.dart';
import 'package:flutter_technical_test_motel_list/core/services/motel.service.dart';
import 'package:flutter_technical_test_motel_list/widgets/dashed.widget.dart';
import 'package:flutter_technical_test_motel_list/widgets/filters.widget.dart';
import 'package:flutter_technical_test_motel_list/widgets/motel.widget.dart';
import 'package:flutter_technical_test_motel_list/widgets/promotion.widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MotelService motelService = MotelService();
  final PageController _promoController = PageController(viewportFraction: 1.0);

  late List<Motel> hotels = [];

  @override
  void initState() {
    _loadMotels();
    super.initState();
  }

  Future<void> _loadMotels() async {
    try {
      final fetchedMotels = await motelService.fetchMotels();
      setState(() {
        hotels = fetchedMotels;
      });
     
      for (var motel in hotels) {
        print(motel.toString());  // Exibe todos os valores de cada Motel
      }
    } catch (e) {
      print("Erro ao carregar os motéis: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: _buildIconButton(
          icon: AppIcons.menuIcon, 
          iconSize: 20,
          action: () {}
        ),
        title: _buildTitle(),
        actions: <Widget>[
          _buildIconButton(
            icon: AppIcons.searchIcon, 
            iconSize: 19,
            action: () {}
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildRegion(value: 'Zona Norte'),
          _buildScroll(),
        ],
      ),
      floatingActionButton: _buildFloatingAction(
        title: 'mapa',
        icon: Icons.map_outlined,
        iconColor: AppColors.primary,
        textColor: AppColors.primary,
        bgColor: AppColors.white,
        action: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Expanded _buildScroll() {
    return Expanded(
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
        child: true ? CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildPromotion(),
            ),
            SliverStickyHeader(
              header: FiltersWidgets(),
              sliver: _buildMotels(motels: hotels),
            ),
          ],
        ) : _buildLoading()
      ),
    );
  }

  Widget _buildShimmerBox({double height = 100, double width = double.infinity, double borderRadius = 8}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, 
      highlightColor: Colors.grey[100]!, 
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  SingleChildScrollView _buildLoading() {
    return SingleChildScrollView(
        child: Column(
          children: [
            FiltersWidgets(loading: true),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerBox(height: 40, width: 40, borderRadius: 40),
                      SizedBox(width: 15),
                      Expanded(
                        child: _buildShimmerBox(height: 90, width: double.infinity, borderRadius: 8)
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildShimmerBox(height: 285, width: double.infinity, borderRadius: 8),
                  SizedBox(height: 5),
                  _buildShimmerBox(height: 100, width: double.infinity, borderRadius: 8),
                  SizedBox(height: 5),
                  _buildShimmerBox(height: 100, width: double.infinity, borderRadius: 8),
                ],
              ),
            ),
          ],
        ),
      );
  }

  SliverList _buildMotels({
    required List<Motel> motels
  }) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var motel = motels[index];
          return MotelWidget(motel: motel);
        },
        childCount: motels.length,
      ),
    );
  }

  Align _buildTitle() {
    return Align(
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
                _buildActionButton(
                  icon: AppIcons.flashIcon, 
                  sizeIcon: 20,
                  title: 'ir agora',
                  active: true
                ),
                _buildActionButton(
                  icon: AppIcons.calendarIcon, 
                  sizeIcon: 18,
                  title: 'ir outro dia',
                  active: false
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildIconButton({
    required String icon,
    required double iconSize,
    required VoidCallback action
  }) {
    return IconButton(
      icon: SizedBox(
        width: iconSize,
        height: iconSize,
        child: SvgPicture.asset(
          icon,
        ),
      ),
      onPressed: action,
    );
  }

  Expanded _buildActionButton({
    required String icon, 
    required double sizeIcon,
    required String title,
    required bool active
  }) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: Container(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 5),
          color: active ? AppColors.white : AppColors.primary900,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: sizeIcon,
                height: sizeIcon,
                child: SvgPicture.asset(
                  icon,
                ),
              ),
              SizedBox(width: active ? 8 : 10),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: AppFontWeight.semiBold,
                    color: active ? AppColors.text : AppColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }

  Align _buildRegion({
    required String value,
  }) {
    return Align(
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
                value.toLowerCase(),
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
                margin: EdgeInsets.only(top: 2),
                child: SvgPicture.asset(
                  AppIcons.arrowDownWhiteIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildPromotion() {
    return Container(
      color: AppColors.secoundary800,
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Column(
        children: [
          Container(
            height: 180,
            margin: EdgeInsets.only(bottom: 10),
            child: PageView.builder(
              controller: _promoController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return PromotionWidget(
                  promotion: Promotion(
                    title: 'Suite Mock', 
                    location: 'cidade - estado', 
                    discount: 0, price: 0.00
                  )
                );
              }
            ),
          ),
          _buildPageIndicator(
            pageController: _promoController,
            count: 3
          )
        ],
      ),
    );
  }

  SmoothPageIndicator _buildPageIndicator({
    required PageController pageController,
    required int count,
  }) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: CustomizableEffect(
        dotDecoration: DotDecoration(
          color: AppColors.secoundary900,
          height: 6,
          width: 6,
          borderRadius: BorderRadius.circular(6)
        ), 
        activeDotDecoration: DotDecoration(
          color: AppColors.secoundary50,
          height: 12,
          width: 12,
          borderRadius: BorderRadius.circular(12)
        ), 
      )
    );
  }

  Container _buildFloatingAction({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Color textColor,
    required Color bgColor,
    required VoidCallback action,
  }) {
    return Container(
      width: 100,
      height: 48,
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
          onTap: action,
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
                  icon,
                  color: iconColor,
                  size: 18,
                ),
                SizedBox(width: 3),
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: AppFontWeight.semiBold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}