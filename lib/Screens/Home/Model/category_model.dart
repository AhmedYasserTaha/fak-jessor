import 'package:flutter/material.dart';

class CategoryModel {
  Color color;
  String title, icon;
  CategoryModel({required this.color, required this.title, required this.icon});
}

List<CategoryModel> categoryList = [
  CategoryModel(
    color: const Color(0xFFFBECD9),
    title: 'Design',
    icon: 'assets/images/design.png',
  ),
  CategoryModel(
    color: const Color(0xFFD2E4FF),
    title: 'Development',
    icon: 'assets/images/development.png',
  ),
  CategoryModel(
    color: const Color(0xFFE1DDFF),
    title: 'Marketing',
    icon: 'assets/images/marketing.png',
  ),
  CategoryModel(
    color: const Color(0xFFFBEAE2),
    title: 'Business',
    icon: 'assets/images/business.png',
  ),
  CategoryModel(
    color: const Color(0xFFDEEDE8),
    title: 'Healthy',
    icon: 'assets/images/healthy.png',
  ),
  CategoryModel(
    color: const Color(0xFFE5F2DC),
    title: 'Photography',
    icon: 'assets/images/photography.png',
  ),
  CategoryModel(
    color: const Color(0xFFF8E2E2),
    title: 'Lifestyle',
    icon: 'assets/images/lifestyle.png',
  ),
  CategoryModel(
    color: const Color(0xFFE1D5FC),
    title: 'Music',
    icon: 'assets/images/music.png',
  ),
];
