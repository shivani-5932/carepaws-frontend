import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/search_bar_widget.dart';
import 'package:care_paws/modules/home/services/caretaker/find/widgets/caretaker_profile_card.dart';
import 'package:care_paws/modules/home/services/caretaker/find/widgets/filter_chip.dart';
import 'package:care_paws/modules/home/services/caretaker/find/widgets/filter_row.dart';
import 'package:flutter/material.dart';

class FindCaretakerScreen extends StatelessWidget {
  const FindCaretakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        backgroundColor: Color(0xFFFDFCFA),
        elevation: 0,
        title: Text("Caretaker", style: AppTextStyles.h1.copyWith(color: Colors.black)),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔍 Search
            const SearchBarWidget(),
            const SizedBox(height: 12),

            /// ⚙️ Filter Row
            const FilterRow(),
            const SizedBox(height: 12),

            /// 🏷️ Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  FilterChipWidget(text: "More than 5 years Exp."),
                  FilterChipWidget(text: "More than 10 years"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// 📋 LIST
            Expanded(
              child: ListView(
                children: const [

                  CaretakerProfileCard(
                    name: "Miss.Kiran Gupta",
                    experience: "10 years",
                    pets: "Dog | Cat | Bird",
                    availability: "24/7",
                    price: "Rs 569/day",
                    rating: "4.9",
                    image: "assets/images/user1.jpg",
                  ),

                  CaretakerProfileCard(
                    name: "Mr Rajan saini",
                    experience: "5 years",
                    pets: "Exotic Pets | Dog",
                    availability: "Everyday except Sunday",
                    price: "Rs 400/day",
                    rating: "4.9",
                    image: "assets/images/user2.jpg",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}