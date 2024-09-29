import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:ecommerce_app/presentation/core/widget/ErrorStateWidget.dart';
import 'package:ecommerce_app/presentation/core/widget/LoadingStateWidget.dart';
import 'package:ecommerce_app/presentation/features/products_screen/presentation/screens/ProductsCatalogArgs.dart';
import 'package:ecommerce_app/presentation/features/products_screen/presentation/screens/ProductsViewModel.dart';
import 'package:ecommerce_app/presentation/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  ProductsCatalogArgs? productsCatalogArgs;
  ProductsScreen(this.productsCatalogArgs,{super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsViewModel viewModel = getIt.get<ProductsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.loadProducts(
      brand: widget.productsCatalogArgs?.brand,
      category: widget.productsCatalogArgs?.category,
      subCategory: widget.productsCatalogArgs?.subCategory,

    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ProductsViewModel, ProductsState>(
                  builder: (context, state) {
                    switch (state) {
                      case ProductsLoaded():
                        {
                          var products = state.products;
                          return GridView.builder(
                            itemCount: products?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: .65,
                            ),
                            itemBuilder: (context, index) {
                              return CustomProductWidget(
                                height: height,
                                width: width,
                                product: products![index],
                              );
                            },
                            scrollDirection: Axis.vertical,
                          );
                        }
                      case LoadingState():
                        {
                          return LoadingStateWidget();
                        }
                      case ErrorState():
                        {
                          return ErrorStateWidget(
                            exception: state.exception,
                          );
                        }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
