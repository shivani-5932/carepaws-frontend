import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/home/online_consult/widget/book_button_widget.dart';
import 'package:flutter/material.dart';

class DoctorCardWidget extends StatelessWidget {

  final Map data;
  final bool showBookButton;

  const DoctorCardWidget({
    super.key,
    required this.data,
    this.showBookButton = false,
  });

  @override
  Widget build(BuildContext context) {

    final isAvailable = data["available"];

    return Container(
      width: 358,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  data["image"],
                  height: 64,
                  width: 64,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 10),

              /// TEXT + RATING
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// NAME + RATING SAME ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Text(
                            data["name"],
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize: 18 ,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                        ),

                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 14, color: Colors.orange),
                            const SizedBox(width: 2),
                            Text(
                              data["rating"],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// SPECIALITY
                    Text(
                      data["speciality"],
                      style: AppTextStyles.bodySmall,
                    ),

                    /// EXP (highlighted slightly)
                    Text(
                      data["exp"],
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// 🔥 REST INFO (IMAGE KE NICHE ALIGN)
          Text(data["lang"], style: AppTextStyles.bodySmall),
          Text(data["distance"], style: AppTextStyles.bodySmall),

          const SizedBox(height: 4),

          /// MODES
          RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.black,
              ),
              children: [

                TextSpan(text: "${data["modes"]} | "),

                 TextSpan(
                  text: "Clinic",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          /// PRICE
          Row(
            children: [
              Expanded(
                child: Text(
                  "Rs ${data["price"]}",
                  style:  AppTextStyles.bodySmall.copyWith(
                      color: Colors.orange,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),

              // Row(
              //   children: [
              //     const Icon(Icons.star,
              //         size: 14, color: Colors.orange),
              //     const SizedBox(width: 2),
              //     Text(
              //       data["rating"],
              //       style: AppTextStyles.bodySmall.copyWith(
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),

          const SizedBox(height: 10),

          /// BUTTON
        if (showBookButton) ...[
          BookButtonWidget(
            isAvailable: isAvailable,
            consultTime: data["consultTime"] ?? "",
          ),

          const SizedBox(height: 20),
    ]
        ],
      ),
    );
  }
}