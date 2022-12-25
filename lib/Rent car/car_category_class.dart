import 'package:flutter/material.dart';

class CarItem{

  final String name;
  final double prise;
  final String imgPath;
  final String color;
  final String feacher;
  final double seat;
  CarItem({
    required this.name,  
    required this.prise, 
    required this.imgPath, 
    required this.color,
    required this.feacher, 
    required  this.seat });
}