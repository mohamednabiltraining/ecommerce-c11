import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/subCategories/sub_categories_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTabContent extends StatefulWidget {
  List<Category> categories;
  CategoriesTabContent(this.categories,{super.key});

  @override
  State<CategoriesTabContent> createState() => _CategoriesTabContentState();
}

class _CategoriesTabContentState extends State<CategoriesTabContent> {
  late Category selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoriesListWidget(widget.categories ??[],onCategoryItemSelected),
        SizedBox(
          width: AppSize.s16,
        ),
        SubCategoriesListWidget(selectedCategory)
      ],
    );
  }

  void onCategoryItemSelected(Category category){
    setState(() {
      selectedCategory = category;
    });
  }
}
