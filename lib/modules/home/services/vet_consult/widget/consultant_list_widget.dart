import 'package:care_paws/modules/home/common_widgets/common_card_widget.dart';
import 'package:care_paws/modules/home/online_consult/view/online_consult_screen.dart';
import 'package:flutter/material.dart';

class ConsultantListWidget extends StatelessWidget {

  final List data;

  const ConsultantListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),

      child: SizedBox(
        height: 227,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,

          itemBuilder: (context, index) {

            final item = data[index];

            return GestureDetector(
                onTap: () {

                  /// 🔥 TYPE DECIDE
                  String type =
                  item["title"].toString().toLowerCase().contains("physical")
                      ? "physical"
                      : "online";

                  /// 🔥 NAVIGATION
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OnlineConsultScreen(
                        initialType: type,
                      ),
                    ),
                  );
                },

                child: CommonCardWidget(
                  image: item["image"],
                  title: item["title"],
                  isSelected: false,
                  height: 227,
                ),
              );

          },
        ),
      ),
    );
  }
}