class BikeBrands {
  final String brand;
  final String model;
  final String imageUrl;
  final String year;
  final String price;
  final double rating;
 const BikeBrands({
    required this.brand,
    required this.model,
    required this.imageUrl,
    required this.year,
    required this.price,
    required this.rating,
  });

 
}

class BikeLogo {
 final String brand;
 final String imageUrl;

  const BikeLogo({
    required this.brand,
    required this.imageUrl,
  });
}
