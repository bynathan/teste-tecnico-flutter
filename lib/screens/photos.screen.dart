import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';

class PhotoGridScreen extends StatelessWidget {
  final List<String> imageUrls;
  final String title;

  const PhotoGridScreen({super.key, required this.imageUrls, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secoundary700,
      appBar: AppBar(
        backgroundColor: AppColors.secoundary700,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: AppFontWeight.semiBold,
            color: AppColors.text,
          ),
          maxLines: 1,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 24,
            height: 24,
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: AppColors.text,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(imageUrls.length, (index) {
              int crossAxisCellCount;
          
              List<int> grid = [0, 3, 4, 7, 8, 11, 12, 15, 16, 19, 20];
          
              if (grid.contains(index)) {
                crossAxisCellCount = 2;
              } else {
                crossAxisCellCount = 1;
              }
          
              return StaggeredGridTile.count(
                crossAxisCellCount: crossAxisCellCount,
                mainAxisCellCount: 1,
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}