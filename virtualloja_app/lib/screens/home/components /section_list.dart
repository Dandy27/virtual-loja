import 'package:flutter/material.dart';
import 'package:virtualloja_app/models/section.dart';
import 'package:virtualloja_app/screens/home/components%20/item_tile.dart';
import 'package:virtualloja_app/screens/home/components%20/section_header.dart';

class SectionList extends StatelessWidget {
  const SectionList(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(section),
          SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return ItemTile(section.items[index]);
                },
                separatorBuilder: (_, __) => const SizedBox(
                  width: 4,
                ),
                itemCount: section.items.length,
              )),
        ],
      ),
    );
  }
}
