import 'package:ecommerce_app/domain/model/SubCategory.dart';
import 'package:ecommerce_app/presentation/core/resources/assets_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/color_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/styles_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:ecommerce_app/presentation/core/routes_manager/routes.dart';
import 'package:ecommerce_app/presentation/features/products_screen/presentation/screens/ProductsCatalogArgs.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final Function navigation;
  Subcategory subcategory;
  SubCategoryItem(this.subcategory, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productsScreenRoute,
      arguments: ProductsCatalogArgs(
        subCategory: subcategory.id
      )),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  border: Border.all(color: ColorManager.primary, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.asset(
            //                  subcategory.image,
                  ImageAssets.categoryCardImage,
                  fit: BoxFit.cover,
                  height: 20,
                ),
              ),
            ),
          ),
          Text(
            '${subcategory.name}',
            maxLines: 2,
            style: getRegularStyle(color: ColorManager.primary).copyWith(
            ),
          )
        ],
      ),
    );
  }
}
