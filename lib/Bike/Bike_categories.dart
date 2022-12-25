import 'package:flutter/material.dart';
import '../Rent car/Cars_ListDisplay.dart';
import '../model/BikeLogos.dart';
class BikeCategories extends StatefulWidget {
  BikeCategories({Key? key}) : super(key: key);

  @override
  State<BikeCategories> createState() => _BikeCategoriesState();
}

class _BikeCategoriesState extends State<BikeCategories> {
   bool isSelected = false;
  late var getSelectedBikes;

  void goTONextPage(String brandName) {
    setState(() {
      isSelected = true;
    });

    getSelectedBikes = bikeBrands_List.where((bike) {
      return bike.brand.contains(brandName);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 72, 146, 75),
        title: Center(child: Text('Choose Bike',)),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text(
              'Brands',
             style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
            ),
          ),
          Container(
            margin: EdgeInsets.all(14),
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => goTONextPage(bikeLogos[index].brand),
                  child: Card(
                    child: Image.network(
                      bikeLogos[index].imageUrl,
                      fit: BoxFit.contain,
                      width: 85,
                    ),
                  ),
                );
              },
              itemCount: bikeLogos.length,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Available Bikes',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.grey),
            ),
          ),
          Container(
            height: 530,
            child: isSelected
                ? ListView.builder(
                    itemBuilder: ((context, index) {
                      return Car_List(
                          image: getSelectedBikes[index].imageUrl,
                          price: getSelectedBikes[index].price,
                          year:  getSelectedBikes[index].year,
                          model: getSelectedBikes[index].model,
                          brand: getSelectedBikes[index].brand);
                      
                     
                    }),
                    itemCount: getSelectedBikes.length,
                  )
                : ListView.builder(
                    itemBuilder: ((context, index) {
                      return Car_List(
                          image: bikeBrands_List[index].imageUrl,
                          price: bikeBrands_List[index].price,
                          year: bikeBrands_List[index].year,
                          model: bikeBrands_List[index].model,
                          brand: bikeBrands_List[index].brand);

                     
                    }),
                    itemCount: bikeBrands_List.length,
                  ),
          ),
        ],
      ),
    );
  }
}