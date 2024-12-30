import 'package:get/get.dart';

class Product {
  int id; //
  String title;//
  String description;//
  String category;//
  double price;//
  double discountPercentage;//
  double rating;//
  int stock;//
  List<String> tags; // 
  String brand; // 
  String sku; //
  int weight;
  Dimensions? dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<Review> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Meta? meta;
  List<String> images;//
  String thumbnail;//
  RxInt qty = 1.obs;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        title: json["title"] ?? "No Title",
        description: json["description"] ?? "No Description",
        category: json["category"] ?? "Unknown",
        price: json["price"]?.toDouble() ?? 0.0,
        discountPercentage: json["discountPercentage"]?.toDouble() ?? 0.0,
        rating: json["rating"]?.toDouble() ?? 0.0,
        stock: json["stock"] ?? 0,
        tags: (json["tags"] != null)
            ? List<String>.from(json["tags"].map((x) => x))
            : [],
        brand: json["brand"] ?? "Unknown",
        sku: json["sku"] ?? "N/A",
        weight: json["weight"] ?? 0,
        dimensions: json["dimensions"] != null
            ? Dimensions.fromJson(json["dimensions"])
            : null,
        warrantyInformation: json["warrantyInformation"] ?? "No Info",
        shippingInformation: json["shippingInformation"] ?? "No Info",
        availabilityStatus: json["availabilityStatus"] ?? "Unknown",
        reviews: (json["reviews"] != null)
            ? List<Review>.from(
                json["reviews"].map((x) => Review.fromJson(x)),
              )
            : [],
        returnPolicy: json["returnPolicy"] ?? "No Policy",
        minimumOrderQuantity: json["minimumOrderQuantity"] ?? 1,
        meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
        images: (json["images"] != null)
            ? List<String>.from(json["images"].map((x) => x))
            : [],
        thumbnail: json["thumbnail"] ?? "No Thumbnail",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble() ?? 0.0,
        height: json["height"]?.toDouble() ?? 0.0,
        depth: json["depth"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Meta {
  DateTime createdAt;
  DateTime updatedAt;
  String barcode;
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.tryParse(json["createdAt"] ?? "") ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? "") ??
            DateTime.fromMillisecondsSinceEpoch(0),
        barcode: json["barcode"] ?? "N/A",
        qrCode: json["qrCode"] ?? "N/A",
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

class Review {
  int rating;
  String comment;
  DateTime date;
  String reviewerName;
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"] ?? 0,
        comment: json["comment"] ?? "No Comment",
        date: DateTime.tryParse(json["date"] ?? "") ??
            DateTime.fromMillisecondsSinceEpoch(0),
        reviewerName: json["reviewerName"] ?? "Anonymous",
        reviewerEmail: json["reviewerEmail"] ?? "N/A",
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}



