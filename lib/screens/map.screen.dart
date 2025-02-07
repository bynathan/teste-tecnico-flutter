import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final String title;

  MapScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          title.toLowerCase(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: AppFontWeight.semiBold,
            color: AppColors.white,
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
              color: AppColors.white,
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
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-23.5505, -46.6333),
          zoom: 10,
        ),
        myLocationEnabled: true,
        mapType: MapType.normal,
      ),
    );
  }
}
