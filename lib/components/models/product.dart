import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color});

  get isFavourite => null;
}

List<Product> products = [
  Product(
      id: 1,
      title: "Forklift",
      price: 8000,
      size: 120,
      description:
          "A heavy-duty forklift designed for lifting and moving heavy materials efficiently, enhancing productivity in warehouses and construction sites.",
      image: "assets/images/forklift.png",
      color: const Color(0xFF005DAA)),
  Product(
      id: 2,
      title: "Pallet Jack",
      price: 2000,
      size: 100,
      description:
          "A versatile pallet jack that simplifies lifting and moving pallets, ideal for quick loading and unloading operations.",
      image: "assets/images/pallet_jack.png",
      color: const Color(0xFFDAA520)),
  Product(
      id: 3,
      title: "Cargo Net",
      price: 300,
      size: 150,
      description:
          "Durable cargo net designed for securing loads during transport, ensuring safety and stability on the road.",
      image: "assets/images/cargo_net.png",
      color: const Color(0xFF8B4513)),
  Product(
      id: 4,
      title: "Dollies",
      price: 500,
      size: 80,
      description:
          "Sturdy dollies built for easy movement of heavy loads, featuring swivel wheels for enhanced maneuverability.",
      image: "assets/images/dollies.png",
      color: const Color(0xFF4682B4)),
  Product(
      id: 5,
      title: "Shipping Containers",
      price: 6000,
      size: 240,
      description:
          "Robust shipping containers perfect for secure transportation of goods across long distances, built to withstand harsh conditions.",
      image: "assets/images/shipping_container.png",
      color: const Color(0xFF808080)),
  Product(
      id: 6,
      title: "Safety Helmets",
      price: 150,
      size: 20,
      description:
          "Lightweight safety helmets providing protection for warehouse workers, designed for comfort and compliance with safety standards.",
      image: "assets/images/safety_helmet.png",
      color: const Color(0xFFFFD700)),
  Product(
      id: 7,
      title: "Cargo Chain",
      price: 250,
      size: 30,
      description:
          "Strong cargo chains for securing loads during transport, designed for durability and reliability in heavy-duty applications.",
      image: "assets/images/chain.png",
      color: const Color(0xFFB22222)),
];

String dummyText =
    "This equipment is essential for managing logistics operations efficiently. It improves safety, productivity, and operational flow.";
