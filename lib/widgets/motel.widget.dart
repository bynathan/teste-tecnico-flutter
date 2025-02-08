// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons.constants.dart';
import 'package:flutter_technical_test_motel_list/core/models/motel.model.dart';
import 'package:flutter_technical_test_motel_list/widgets/suite.widget.dart';

class MotelWidget extends StatefulWidget {
  final Motel motel;

  const MotelWidget({
    super.key,
    required this.motel,
  });

  @override
  State<MotelWidget> createState() => _MotelWidgetState();
}

class _MotelWidgetState extends State<MotelWidget> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: bottomPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildHeaderHotel(),
          SuiteWidget(suites: widget.motel.suites)
        ],
      ),
    );
  }

  Container _buildHeaderHotel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHotelLogo(),
          SizedBox(width: 15),
          _buildHotemDetails(),
          SizedBox(width: 15),
          _buildFavorite(),
        ],
      ),
    );
  }

  Container _buildHotelLogo() {
    return Container(
      margin: EdgeInsets.only(top: 11),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Image.network(
            widget.motel.logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Column _buildHotemDetails() {
    Size screenSize = MediaQuery.of(context).size;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenSize.width - 140,
          child: Stack(
            children: [
              ClipRRect(
                child: SizedBox(
                  height: 40,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.motel.name.toLowerCase(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: AppFontWeight.regular,
                        color: AppColors.text,
                        height: 1.3,
                      ),
                      maxLines: 1,
                    ),
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
            widget.motel.neighborhood.toLowerCase(),
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
                    widget.motel.rating.toString(),
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
                  '${widget.motel.reviewsCount} avalizações',
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
    );
  }

  GestureDetector _buildFavorite() {
    return GestureDetector(
      onTap: () {
        setState(() {
          favorite = !favorite;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 6),
        child: Icon(
          Icons.favorite,
          color: favorite ? AppColors.primary : AppColors.secoundary900,
          size: 32.0,
        ),
      ),
    );
  }
}