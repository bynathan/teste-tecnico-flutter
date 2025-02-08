import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors_constants.dart';
import 'package:flutter_technical_test_motel_list/core/models/filter_model.dart';
import 'package:flutter_technical_test_motel_list/widgets/filter_widget.dart';

class FiltersWidgets extends StatefulWidget {
  final bool? loading;

  const FiltersWidgets({super.key, this.loading});

  @override
  State<FiltersWidgets> createState() => _FiltersWidgetsState();
}

class _FiltersWidgetsState extends State<FiltersWidgets> {
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
    return Container(
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
            return IgnorePointer(
              ignoring: widget.loading ?? false,
              child: FilterItemWidget(
                loading: widget.loading ?? false,
                index: index,
                filter: filter,
                onPressed: () {
                  setState(() {
                    filter.isSelected = !filter.isSelected;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}