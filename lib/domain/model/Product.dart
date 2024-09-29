import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/SubCategory.dart';

/// sold : 2440
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680400287765-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680400287767-4.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680400287767-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680400287765-2.jpeg"]
/// subcategory : [{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}]
/// ratingsQuantity : 6
/// _id : "6428dfa0dc1175abc65ca067"
/// title : "Logo T-Shirt Green"
/// slug : "logo-t-shirt-green"
/// description : "Soft and comfortable cotton fabric\nCrew neck and short sleeves\nComfortable, regular fit\nWash according to care label instructions"
/// quantity : 111
/// price : 744
/// priceAfterDiscount : 379
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680400287654-cover.jpeg"
/// category : {"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"}
/// brand : {"_id":"64089dc924b25627a25315a8","name":"Jack & Jones","slug":"jack-and-jones","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286281363.png"}
/// ratingsAverage : 2
/// createdAt : "2023-04-02T01:51:28.886Z"
/// updatedAt : "2024-09-29T07:02:18.405Z"
/// id : "6428dfa0dc1175abc65ca067"

class Product {
  Product({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.priceAfterDiscount, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      });

  num? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;


}