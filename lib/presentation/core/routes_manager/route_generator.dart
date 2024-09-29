import 'package:ecommerce_app/presentation/core/routes_manager/routes.dart';
import 'package:ecommerce_app/presentation/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/presentation/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/presentation/features/cart/screens/cart_screen.dart';
import 'package:ecommerce_app/presentation/features/main_layout/main_layout.dart';
import 'package:ecommerce_app/presentation/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/presentation/features/products_screen/presentation/screens/ProductsCatalogArgs.dart';
import 'package:ecommerce_app/presentation/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => ProductsScreen(
            settings.arguments as ProductsCatalogArgs?
        ));

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetails());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
