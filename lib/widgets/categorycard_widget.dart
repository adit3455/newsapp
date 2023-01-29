import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String categoryRepo;

  const CategoryCardWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.categoryRepo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/category', arguments: categoryRepo),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withRed(200).withBlue(250),
            borderRadius: BorderRadius.circular(20.0)),
        width: MediaQuery.of(context).size.width * 0.29,
        child: Tab(
          icon: Icon(icon, size: 35.0),
          text: label,
          iconMargin: const EdgeInsets.all(0.0),
        ),
      ),
    );
  }
}
