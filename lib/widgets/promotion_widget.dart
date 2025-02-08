// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/widgets/currency_widget.dart';
import 'package:flutter_technical_test_motel_list/constants/colors_constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts_constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons_constants.dart';
import 'package:flutter_technical_test_motel_list/core/models/promotion_model.dart';

class PromotionWidget extends StatelessWidget {
  final Promotion promotion;

  const PromotionWidget({
    super.key,
    required this.promotion,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 180,
            height: double.infinity,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AppColors.secoundary800,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Center(
            child: SizedBox(
              width: screenSize.width - 240,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.campaign,
                        color: AppColors.primary,
                        size: 24,
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                        width: screenSize.width - 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              promotion.title.toLowerCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: AppFontWeight.semiBold,
                                color: AppColors.text,
                                height: 1,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              promotion.location.toLowerCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: AppFontWeight.regular,
                                color: AppColors.text,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 8),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: AppColors.secoundary800,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${promotion.discount}% de desconto',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: AppFontWeight.semiBold,
                            color: AppColors.text,
                            height: 1,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 2,
                          margin: EdgeInsets.only(top: 9, bottom: 3),
                          color: AppColors.white,
                        ),
                        Text(
                          'a partir de ${CurrencyWidget(promotion.price)}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: AppFontWeight.regular,
                            color: AppColors.text,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            width: double.infinity,
                            height: 35,
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "reservar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: AppFontWeight.semiBold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SvgPicture.asset(
                                  AppIcons.arrowRightWhiteIcon,
                                  width: 10,
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
