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
      price: 112,
      description: "GG",
      image: "assets/images/Wand.png",
      color: Color(0xFFBD55F0)),
  Product(
      id: 2,
      name: "Clitoral Vibrator",
      price: 51,
      description: "GG",
      image: "assets/images/Wand2.png",
      color: Color(0xFFFCC6DF)),
  Product(
      id: 3,
      name: "Clit Suction Toys",
      price: 61,
      description: "GG",
      image: "assets/images/Clit_Suction.png",
      color: Color(0xFFDF69B9)),
  Product(
      id: 4,
      name: "Magic Toy",
      price: 122,
      description: "GG",
      image: "assets/images/Clitoral.png",
      color: Color(0xFFB388CA)),
];

List<Product> critoral = [
  Product(
      id: 1,
      name: "Clitoral Suction I",
      price: 130,
      description: "GG",
      image: "assets/images/ClitoralVi-1.png",
      color: Color(0xFFB74D7C)),
  Product(
      id: 2,
      name: "Clitoral Suction II",
      price: 150,
      description: "GG",
      image: "assets/images/ClitoralVi-2.png",
      color: Color(0xFFDCAAE5)),
  Product(
      id: 3,
      name: "Clitoral Toys",
      price: 99,
      description: "GG",
      image: "assets/images/ClitoralVi-3.png",
      color: Color(0xFFDCAAE5)),
  Product(
      id: 4,
      name: "Clitoral Toy MK2",
      price: 150,
      description: "GG",
      image: "assets/images/ClitoralVi-4.png",
      color: Color(0xFFFCC6DF)),
];

List<Product> clit = [
  Product(
      id: 1,
      name: "Clit Suction I",
      price: 95,
      description: "GG",
      image: "assets/images/SlitSuction-1.png",
      color: Color(0xFFDCAAE5)),
  Product(
      id: 2,
      name: "Clit Magic",
      price: 666,
      description: "GG",
      image: "assets/images/SlitSuction-2.png",
      color: Color(0xFFDBC5C0)),
  Product(
      id: 3,
      name: "Clit Suction MK2",
      price: 191,
      description: "GG",
      image: "assets/images/SlitSuction-3.png",
      color: Color(0xFFB8D7D5)),
  Product(
      id: 4,
      name: "Clit Suction MK3",
      price: 333,
      description: "GG",
      image: "assets/images/SlitSuction-4.png",
      color: Color(0xFFDCAAE5)),
];

List<Product> dildos = [
  Product(
      id: 1,
      name: "BBC",
      price: 500,
      description: "GG",
      image: "assets/images/Dildo-1.png",
      color: Color(0xFFFFFEE8)),
  Product(
      id: 2,
      name: "BBC MK1",
      price: 550,
      description: "GG",
      image: "assets/images/Dildo-2.png",
      color: Color(0xFF212424)),
  Product(
      id: 3,
      name: "Clit Suction Toys",
      price: 111,
      description: "GG",
      image: "assets/images/Dildo-3.png",
      color: Color(0xFFDCAAE5)),
  Product(
      id: 4,
      name: "Dildos",
      price: 111,
      description: "GG",
      image: "assets/images/Dildo-4.png",
      color: Color(0xFFE9C6DD)),
];
