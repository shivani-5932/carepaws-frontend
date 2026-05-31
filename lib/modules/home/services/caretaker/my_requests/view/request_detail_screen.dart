import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:care_paws/modules/home/services/caretaker/caretaker_profile/model/caretaker_request_model.dart';
import 'package:care_paws/modules/home/services/caretaker/my_requests/widget/detail_row.dart';
import 'package:care_paws/modules/home/services/caretaker/my_requests/widget/section_text.dart';
import 'package:flutter/material.dart';

class RequestDetailScreen extends StatelessWidget {

  // final RequestModel data;
  final bool isCaretaker;

  const RequestDetailScreen({
    super.key,
    // required this.data,
    this.isCaretaker = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        backgroundColor: Color(0xFFFDFCFA),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title:  Text(
          "View Details",
          style: AppTextStyles.h1.copyWith(color: Colors.black),
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 TOP ROW (IMAGE + BASIC INFO)
            Row(
              children: [

               ProfileAvatarWidget(image: "assets/images/cat1.png",size: 90,),

                const SizedBox(width: 12),

                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailRow(label: "Pet Name", value: "Bruno (Dog)",),
                      DetailRow(label: "Breed", value: "German Shepherd"),
                      DetailRow(label: "Age", value: "12 months"),
                      DetailRow(label: "Pet Weight", value: "12 kg"),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 14),

            /// 🔹 OTHER DETAILS
            const DetailRow(label: "Care Duration", value: "5 days"),

            Row(
              children:  [
                Text("Location : ",
                style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600,color: Colors.black),),
                Text("Sharifpura, Asr"),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),

            const SizedBox(height: 4),
            const Text("1 km away", style: TextStyle(fontSize: 12)),

            const SizedBox(height: 10),

             Text(
              "Rs 400/day",
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

             Text(
              "Pet Diet is not included in the charges",
              style: AppTextStyles.bodySmall,
            ),

            const SizedBox(height: 12),

            /// 🔹 SPECIAL INSTRUCTIONS
            const SectionText(
              title: "Special instructions",
              value: "He has allergy from peanut butter.",
            ),

            /// 🔹 FOOD DETAILS
            const SectionText(
              title: "Food/ Medicine details",
              value: "tablet 500 g at night on alternative days.",
            ),
            if (isCaretaker) ...[
              const Spacer(),

              PrimaryButton(
                  text: "Contact",
              onTap: (){

              },
              ),
            ]
          ],
        ),
      ),
    );
  }
}