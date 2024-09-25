import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/sub_categories_list.dart';
import 'package:flutter/cupertino.dart';

class CategoriesTabContent extends StatelessWidget {
  List<Category> categories;
  CategoriesTabContent(this.categories,{super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoriesListWidget(categories ??[]),
        SizedBox(
          width: AppSize.s16,
        ),
        SubCategoriesList()
      ],
    );
  }
}
