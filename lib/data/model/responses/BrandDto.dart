import 'package:ecommerce_app/domain/model/Brand.dart';

/// _id : "64089fe824b25627a25315d1"
/// name : "Canon"
/// slug : "canon"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png"

class BrandDto {
  BrandDto({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  BrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  Brand toBrand() {
    return Brand(
      id: id,
      name: name,
      slug: slug,
      image: image
    );
  }

}