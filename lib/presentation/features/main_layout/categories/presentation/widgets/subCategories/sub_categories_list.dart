import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/presentation/core/resources/assets_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/color_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/font_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/styles_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:ecommerce_app/presentation/core/widget/ErrorStateWidget.dart';
import 'package:ecommerce_app/presentation/core/widget/LoadingStateWidget.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/subCategories/SubCategoriesViewModel.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/subCategories/sub_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SubCategoriesListWidget extends StatefulWidget {
  Category category;
  SubCategoriesListWidget(this.category,{super.key});

  @override
  State<SubCategoriesListWidget> createState() => _SubCategoriesListWidgetState();
}

class _SubCategoriesListWidgetState extends State<SubCategoriesListWidget> {
  SubCategoriesViewModel viewModel = getIt.get<SubCategoriesViewModel>();

  @override
  void didUpdateWidget(covariant SubCategoriesListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.category != widget.category){
      viewModel.loadSubCategories(widget.category.id);
    }
  }
  @override
  void initState() {
    super.initState();
    viewModel.loadSubCategories(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Expanded(
        flex: 2,
        child: CustomScrollView(
          slivers: <Widget>[
            // category title
            SliverToBoxAdapter(
              child: Text(
                '${widget.category.name}',
                style: getBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s14),
              ),
            ),
            // the category card
            // the grid view of the subcategories
            BlocBuilder<SubCategoriesViewModel,SubCategoriesState>(
             builder: (context, state) {
               switch (state) {

                 case LoadingState():{
                   return SliverToBoxAdapter(
                       child: LoadingStateWidget());
                 }
                 case ErrorState():{
                   return SliverToBoxAdapter(child: ErrorStateWidget(exception : state.exception));
                 }
                 case SuccessState():{
                   var subCategories = state.subCategories;
                   return SliverGrid(
                       delegate: SliverChildBuilderDelegate(
                         childCount: subCategories.length,
                             (context, index) => SubCategoryItem(
                               subCategories[index],
                                 goToCategoryProductsListScreen),
                       ),
                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         childAspectRatio: 1,
                         mainAxisSpacing: AppSize.s8,
                         crossAxisSpacing: AppSize.s8,
                       ))
                   ;
                 }
               }
             },
            )
          ],
        ),
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
