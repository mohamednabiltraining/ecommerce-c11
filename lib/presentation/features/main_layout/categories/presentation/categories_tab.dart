import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:ecommerce_app/presentation/core/widget/ErrorStateWidget.dart';
import 'package:ecommerce_app/presentation/core/widget/LoadingStateWidget.dart';
import 'package:ecommerce_app/presentation/features/main_layout/CategoriesViewModel.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/CategoriesTabContent.dart';
import 'package:ecommerce_app/presentation/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  var categoriesViewModel = getIt.get<CategoriesViewModel>();

  @override
  void initState() {
    super.initState();
    categoriesViewModel.loadCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesViewModel>(
      create: (context) => categoriesViewModel,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: BlocBuilder<CategoriesViewModel,CategoriesState>(
              builder: (context, state) {
                switch (state) {

                  case CategoriesLoadedState():{
                    return CategoriesTabContent(state.categories ??[]);
                  }
                  case CategoriesLoadingState():
                  return Center(child: LoadingStateWidget());
                  case CategoriesErrorState():{
                    return ErrorStateWidget(exception: state.exception);
                  }
                }

                    //                   CategoriesList()
              },
          ),
        ),
      ),
    );
  }
}
