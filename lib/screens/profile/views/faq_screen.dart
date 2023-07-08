import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/constants/styles.dart';
import 'package:waste_management_app/screens/profile/data/faqs.dart';
import 'package:waste_management_app/screens/shop/views/components/confirmOrder/collapased_header.dart';
import 'package:waste_management_app/sharedWidgets/top_header_with_back.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopHeaderWithBackButton(
                title: 'FAQs',
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9 - 35,
                child: ListView.builder(
                  itemCount: faqList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: ExpandablePanel(
                        theme: expandableTheme,
                        header: CollapsedHeader(
                          stepNumber: index + 1,
                          title: faqList[index].question,
                        ),
                        collapsed: Container(),
                        expanded: Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          ),
                          child: Text(
                            faqList[index].answer,
                            style: kSubtitleStyle,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
