import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';

class ItemsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mainItems;
  final List<Map<String, dynamic>> items;
  final String name;

  const ItemsScreen({super.key, required this.mainItems, required this.items, required this.name});

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.secoundary700,
      appBar: AppBar(
        backgroundColor: AppColors.secoundary700,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Transform.rotate(
            angle: 270 * 3.14159 / 180,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: AppColors.text,
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 24,
            height: 24,
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: bottomPadding),
            child: Column(
              children: [
                _buildTitle(),
                SizedBox(height: 50),
                _buildSection(title: 'principais itens'),
                SizedBox(height: 35),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...mainItems.map((item) => _buildMainItem(item: item))
                  ],
                ),
                SizedBox(height: 35),
                _buildSection(title: 'tem também'),
                SizedBox(height: 35),
                _buildListItems(list: items)
              ],
            )
          ),
        ),
      ),
    );
  }

  Text _buildListItems({
    required List<Map<String, dynamic>> list
  }) {
    String title = list.map((map) => map['nome'] ?? '').join(', ');

    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: AppFontWeight.regular,
        color: AppColors.text,
      ),
      textAlign: TextAlign.start,
    );
  }

  Text _buildTitle() {
    return Text(
      name.toLowerCase(),
      style: TextStyle(
        fontSize: 30,
        fontWeight: AppFontWeight.regular,
        color: AppColors.text,
        height: 1
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Row _buildSection({
    required String title
  }) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Container(
              height: 1,
              color: AppColors.secoundary900,
            ),
          )
        ),
        SizedBox(width: 14),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: AppFontWeight.semiBold,
            color: AppColors.text,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(width: 15),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.secoundary900,
          )
        )
      ],
    );
  }

  Container _buildMainItem({
    required Map<String, dynamic> item
  }) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            item["icone"],
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 5),
          Text(
            item["nome"].toLowerCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: AppFontWeight.regular,
              color: AppColors.text,
              height: 1
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}