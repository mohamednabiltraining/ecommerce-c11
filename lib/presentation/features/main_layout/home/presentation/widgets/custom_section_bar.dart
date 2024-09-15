import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomSectionBar extends StatelessWidget {
  final String sectionNname;
  final Function onViewAllClick;
  const CustomSectionBar(
      {super.key, required this.sectionNname, required this.onViewAllClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionNname,
            style: getMediumStyle(
              fontSize: 18,
              color: ColorManager.darkBlue,
            ),
          ),
          TextButton(
            onPressed: () {
              onViewAllClick();
            },
            child: Text(
              'view all',
              style: getMediumStyle(color: ColorManager.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
