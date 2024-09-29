import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/SubCategory.dart';

/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"
/// createdAt : "2023-04-14T22:39:24.365Z"
/// updatedAt : "2023-04-14T22:39:24.365Z"

class SubCategoryDto {
  SubCategoryDto({
      this.id, 
      this.name, 
      this.slug, 
    this.category});

  SubCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

  Subcategory toSubCategory(){
    return Subcategory(
        id: id,
        name: name,
        slug: slug,
        category: category
    );
  }
}