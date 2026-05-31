import 'package:care_paws/modules/home/services/caretaker/caretaker_profile/model/caretaker_request_model.dart';
import 'package:care_paws/modules/home/services/caretaker/my_requests/view/request_detail_screen.dart';
import 'package:care_paws/modules/home/services/caretaker/my_requests/widget/my_request_card.dart';
import 'package:flutter/material.dart';


class CaretakerRequestsScreen extends StatelessWidget {
  const CaretakerRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final requests = [
      RequestModel(
        petName: "Bruno (Dog)",
        breed: "German Shepherd",
        age: "12 months",
        weight: "12 kg",
        duration: "5 days",
        location: "Sharifpura, Asr",
        distance: "1 km away",
        price: "Rs 400/day",
        instructions: "He has allergy from peanut butter.",
        foodDetails: "tablet 500 g at night on alternative days.",
        image: "assets/images/dog.jpg",
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        title: const Text("Caretaker"),
        actions: const [
          Icon(Icons.tune),
          SizedBox(width: 10),
          Icon(Icons.notifications_none),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const Text(
              "Requests",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];

                  return MyRequestCard(
                    // 🔥 SAME CARD
                    isSelected: false,
                    selectionMode: false,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) =>
                      //         // RequestDetailScreen(data: request),
                      //   ),
                      // );
                    },
                    onLongPress: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

