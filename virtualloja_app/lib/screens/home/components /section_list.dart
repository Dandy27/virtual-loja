import 'package:flutter/material.dart';
import 'package:virtualloja_app/models/section.dart';
import 'package:virtualloja_app/screens/home/components%20/section_header.dart';

class SectionList extends StatelessWidget {
  const SectionList(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(section),
          SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        section.items[index].image,
                        fit: BoxFit.cover,
                      ));
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
