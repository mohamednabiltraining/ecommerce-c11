import 'dart:async';

import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/presentation/core/widget/ErrorStateWidget.dart';
import 'package:ecommerce_app/presentation/core/widget/LoadingStateWidget.dart';
import 'package:ecommerce_app/presentation/features/main_layout/home/presentation/BrandsViewModel.dart';
import 'package:ecommerce_app/presentation/features/main_layout/home/presentation/CategoriesViewModel.dart' ;
import 'package:ecommerce_app/presentation/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/presentation/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    categoriesViewModel.loadCategories();
    brandsViewModel.loadBrands();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // field injection
  var categoriesViewModel = getIt.get<CategoriesViewModel>();
  var brandsViewModel = getIt.get<BrandsViewModel>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider<BrandsViewModel>(
        create: (BuildContext context) => brandsViewModel,
      ),
      BlocProvider<CategoriesViewModel>(
        create: (BuildContext context) => categoriesViewModel
      ),

    ], child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAdsWidget(
                adsImages: adsImages,
                currentIndex: _currentIndex,
                timer: _timer,
              ),
              Column(
                children: [
                  CustomSectionBar(sectionNname: 'Categories', onViewAllClick: () {}),
                  BlocBuilder<CategoriesViewModel,CategoriesState>(
                    builder:(context, state) {
                      switch (state) {

                        case InitialHomeState():{
                          return LoadingStateWidget();
                        }
                        case CategoriesLoadedState():{
                          var categories = state.categories ?? [];
                          return SizedBox(
                            height: 270.h,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CustomCategoryWidget(categories[index]);
                              },
                              itemCount: categories.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            ),
                          );
                        }
                        case CategoriesLoadingState():{
                          return LoadingStateWidget();
                        }
                        case CategoriesErrorState():{
                          return ErrorStateWidget(exception: state.exception,);

                          }
                      }
                      },
                  ),
                  SizedBox(height: 12.h),
                  CustomSectionBar(
                    sectionNname: 'Brands',
                    onViewAllClick: () {},
                  ),
                  BlocBuilder<BrandsViewModel, BrandsState>(
                    buildWhen: (previous, current) {
                      if(current is CategoriesState){
                        return false;
                      }
                      return true;
                    },
                    builder: (context, state) {

                      switch (state) {

                        case BrandsLoadedState():{
                          var brands = state.brands ?? [];
                          return SizedBox(
                            height: 270.h,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CustomBrandWidget(brands[index] ??Brand());
                              },
                              itemCount: brands.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            ),
                          );
                        }
                        case BrandsLoadingState():
                        return LoadingStateWidget();
                        case BrandsErrorState():
                          return ErrorStateWidget(exception: state.exception);                      }
                    },
                  ),

                  // CustomSectionBar(
                  //   sectionNname: 'Most Selling Products',
                  //   onViewAllClick: () {},
                  // ),
                  // SizedBox(
                  //   child: SizedBox(
                  //     height: 360.h,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return const ProductCard(
                  //           title: "Nike Air Jordon",
                  //           description:
                  //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                  //           rating: 4.5,
                  //           price: 1100,
                  //           priceBeforeDiscound: 1500,
                  //           image: ImageAssets.categoryHomeImage,
                  //         );
                  //       },
                  //       itemCount: 20,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 12.h),
                ],
              )
            ],
          ),
        ));

  }
}
