import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final num price, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 0,
      title: "Office Code",
      price: 234,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 1,
      title: "Belt Bag",
      price: 234,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 2,
      title: "Hang Top",
      price: 234,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: const Color(0xFF989493)),
  Product(
      id: 3,
      title: "Old Fashion",
      price: 234,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 4,
      title: "Office Code",
      price: 234,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 5,
    title: "Office Code",
    price: 234,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: const Color(0xFFAEAEAE),
  ),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    description: dummyText,
    image: "assets/images/bag_7.png",
    color: const Color.fromARGB(255, 175, 73, 73),
  ),
  Product(
    id: 7,
    title: "Office Code",
    price: 234,
    description: dummyText,
    image: "assets/images/bag_8.png",
    color: const Color.fromARGB(151, 209, 165, 148),
  ),
  Product(
    id: 8,
    title: "Office Code",
    price: 234,
    description: dummyText,
    image: "assets/images/bag_9.png",
    color: const Color.fromARGB(255, 86, 152, 214),
  ),
  Product(
    id: 9,
    title: "Office Code",
    price: 234,
    description: dummyText,
    image: "assets/images/bag_10.png",
    color: const Color.fromARGB(255, 20, 197, 144),
  ),
];
var dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";
