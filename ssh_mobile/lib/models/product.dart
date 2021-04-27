import 'package:flutter/material.dart';

class Product {
  final String image, name, description;
  final int price, id;
  final Color color;
  Product({
    this.image,
    this.id,
    this.price,
    this.color,
    this.description,
    this.name,
  });
}

List<Product> products = [
  Product(
      id: 1,
      name: "Wand Vibrator",
      price: 111,
      description: "GG",
      image: "assets/images/Wand.png",
      color: Color(0xFFBD55F0)),
  Product(
      id: 2,
      name: "Clitoral Vibrator",
      price: 111,
      description: "GG",
      image: "assets/images/Wand2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      name: "Clit Suction Toys",
      price: 111,
      description: "GG",
      image: "assets/images/Clit_Suction.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      name: "Dildos",
      price: 111,
      description: "GG",
      image: "assets/images/Clitoral.png",
      color: Color(0xFFE6B398)),
];
