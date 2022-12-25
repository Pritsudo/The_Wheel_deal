import 'package:flutter/material.dart';
import 'Cars_ListDisplay.dart';

import '/model/carLogos.dart';


class CarCategoryScreen extends StatefulWidget {
  const CarCategoryScreen({Key? key}) : super(key: key);

  @override
  State<CarCategoryScreen> createState() => _CarCategoryScreenState();
}

class _CarCategoryScreenState extends State<CarCategoryScreen> {
  
  bool isSelected = false;
  late var getSelectedCars;

  void goTONextPage(String brandName) {
    setState(() {
      isSelected = true;
    });

    getSelectedCars = CarBrands_List.where((car) {
      return car.brand.contains(brandName);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Choose a Car',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            
          ),
        ),
        backgroundColor: Color.fromARGB(255, 72, 146, 75),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
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
                  onTap: () => goTONextPage(carLogos[index].brand),
                  child: Card(
                    child: Image.network(
                      carLogos[index].imageUrl,
                      fit: BoxFit.contain,
                      width: 85,
                    ),
                  ),
                );
              },
              itemCount: carLogos.length,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Available Cars',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.grey),
            ),
          ),
          Container(
            height: 530,
            child: isSelected
                ? ListView.builder(
                    itemBuilder: ((context, index) {
                      return Car_List(
                          image: getSelectedCars[index].imageUrl,
                          price: getSelectedCars[index].price,
                          year: getSelectedCars[index].year,
                          model: getSelectedCars[index].model,
                          brand: getSelectedCars[index].brand);
                      
                     
                    }),
                    itemCount: getSelectedCars.length,
                  )
                : ListView.builder(
                    itemBuilder: ((context, index) {
                      return Car_List(
                          image: CarBrands_List[index].imageUrl,
                          price: CarBrands_List[index].price,
                          year: CarBrands_List[index].year,
                          model: CarBrands_List[index].model,
                          brand: CarBrands_List[index].brand);

                     
                    }),
                    itemCount: CarBrands_List.length,
                  ),
          ),
        ],
      ),
    );
  }
}
