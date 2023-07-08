import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.onTap,
  });
  final String title;
  final String description;
  final String imagePath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          right: 8,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kSecondaryColor,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kTitle2Style,
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: kSubtitleEmphasisStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kPrimaryColor,
                    ),
                    child: Text(
                      'VIEW MORE',
                      style: kSubtitleEmphasisStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SvgPicture.asset(
                imagePath,
                height: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
