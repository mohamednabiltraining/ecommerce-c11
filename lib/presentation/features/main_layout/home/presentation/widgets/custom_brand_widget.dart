import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/presentation/core/routes_manager/routes.dart';
import 'package:ecommerce_app/presentation/features/products_screen/presentation/screens/ProductsCatalogArgs.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  Brand brand;
  CustomBrandWidget(this.brand,{super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productsScreenRoute,
          arguments: ProductsCatalogArgs(
            brand: brand.id
          )),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
              brand.image??""
              ,fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


        // CachedNetworkImage(
        //   height: 80,
        //   width: 80,
        //   fit: BoxFit.cover,
        //   imageUrl: ImageAssets.categoryHomeImage,
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) =>
        //       const Center(child: Icon(Icons.error)),
        //   imageBuilder: (context, imageProvider) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //           image: imageProvider,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     );
        //   },
        // ),