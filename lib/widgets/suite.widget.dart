// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons.constants.dart';
import 'package:flutter_technical_test_motel_list/screens/photos.screen.dart';
import 'package:flutter_technical_test_motel_list/widgets/currency.widget.dart';

class SuiteWidget extends StatefulWidget {
  final List<Map<String, dynamic>> suites;

  const SuiteWidget({
    super.key,
    required this.suites,
  });

  @override
  State<SuiteWidget> createState() => _SuiteWidgetState();
}

class _SuiteWidgetState extends State<SuiteWidget> {
  @override
  Widget build(BuildContext context) {
    final PageController suitesController = PageController(viewportFraction: 0.9);

    return SizedBox(
      height: 400 + (121 * (widget.suites[0]['periodos'].length)).toDouble(),
      child: PageView.builder(
        controller: suitesController,
        itemCount: widget.suites.length,
        itemBuilder: (context, index) {
          var suite = widget.suites[index];

          return Container(
            margin: index == (widget.suites.length - 1) ? EdgeInsets.only(right: 0) : EdgeInsets.only(right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSuitePhoto(context, suite: suite),
                _buildSuiteItems(suite: suite),
                ...suite["periodos"].map((item) => _buildSuiteTimePrice(
                  time: item["tempoFormatado"], 
                  price: item["valor"]
                )).toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _buildSuitePhoto(BuildContext context, {
    required Map<String, dynamic> suite
  }) {
    Size screenSize = MediaQuery.of(context).size;

    void navigateToPhotoGridScreen(BuildContext context, List<String> imageUrls, String title) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return PhotoGridScreen(imageUrls: imageUrls, title: title);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    }

    return Container(
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
                child: GestureDetector(
                  onTap: () => navigateToPhotoGridScreen(context, suite["fotos"], suite["nome"].toLowerCase()),
                  child: SizedBox(
                    height: 225,
                    width: double.infinity,
                    child: Image.network(
                      suite['fotos'][0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Container(
                width: screenSize.width,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: _buildSuiteTitle(suite: suite),
              )
            ],
          ),
        ),
      ),
    );
  }

  LayoutBuilder _buildSuiteTitle({
    required Map<String, dynamic> suite
  }) {
    Size screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        final text = suite['nome'].toLowerCase();
        final textStyle = TextStyle(
          fontSize: 22,
          fontWeight: AppFontWeight.regular,
          color: AppColors.text,
          height: 1.3,
        );

        final textSpan = TextSpan(text: text, style: textStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          maxLines: 1,
        );
        textPainter.layout(minWidth: 0, maxWidth: constraints.maxWidth);

        bool isOverflow = textPainter.didExceedMaxLines;
        
        return Stack(
          children: [
            ClipRRect(
              child: SizedBox(
                height: 32,
                child: FittedBox(
                  fit: BoxFit.cover,
                  alignment: !isOverflow ? Alignment.center : Alignment.centerLeft,
                  child: SizedBox(
                    width: screenSize.width,
                    child: Text(
                      text,
                      style: textStyle,
                      maxLines: 1,
                      textAlign: !isOverflow ? TextAlign.center : TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
            if(isOverflow)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(51, 239, 241, 240),
                      AppColors.white,
                      AppColors.white,
                    ],
                    stops: [0, 0.6, 1.0],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Container _buildSuiteItems({
    required Map<String, dynamic> suite
  }) {
    return Container(
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
              ...suite["categoriaItens"].take(4).map((item) => _buildItem(icon: item["icone"])).toList(),
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
    );
  }

  Container _buildItem({
    required String icon
  }) {
    return Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(right: 13),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              icon,
            ),
          ),
        ),
      );
  }

  Container _buildSuiteTimePrice({
    required String time,
    required double price
  }) {
    return Container(
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
                    time,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: AppFontWeight.regular,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    CurrencyWidget(price).toString(),
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
    );
  }
}