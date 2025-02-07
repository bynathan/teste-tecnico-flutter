// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons.constants.dart';
import 'package:flutter_technical_test_motel_list/core/models/filter.model.dart';

class FilterItemWidget extends StatefulWidget {
  final int index;
  final Filter filter;
  final Function() onPressed;

  const FilterItemWidget({required this.index, required this.filter, required this.onPressed, super.key});

  @override
  State<FilterItemWidget> createState() => _FilterItemStateWidget();
}

class _FilterItemStateWidget extends State<FilterItemWidget> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.index == 0,
      child: Container(
        padding: EdgeInsets.only(left: widget.index == 0 ? 0 : 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){
            widget.onPressed();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: widget.filter.isSelected ? AppColors.primary900 : AppColors.secoundary,
              ),
              color: widget.filter.isSelected ? AppColors.primary900 : Colors.white,
            ),
            child: Row(
              children: [
                if (widget.index == 0)
                Row(
                  children: [
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: SvgPicture.asset(
                        AppIcons.filterIcon
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Center(
                  child: Text(
                    widget.filter.name,
                    style: TextStyle(color: widget.filter.isSelected ? AppColors.white : AppColors.text, fontSize: 13, fontWeight: AppFontWeight.semiBold),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}