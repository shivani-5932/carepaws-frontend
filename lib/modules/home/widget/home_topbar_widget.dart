import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class HomeTopBarWidget extends StatefulWidget {
  const HomeTopBarWidget({super.key});

  @override
  State<HomeTopBarWidget> createState() => _HomeTopBarWidgetState();
}

class _HomeTopBarWidgetState extends State<HomeTopBarWidget> {

  String selectedLocation = "Sharifpura, Asr";

  final List<String> locations = [
    "Sharifpura, Asr",
    "Amritsar",
    "Ludhiana",
    "Jalandhar",
  ];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        children: [

          /// 🐾 LOGO + NAME
          Row(
            children: [
              Image.asset(
                "assets/icons/logo_circle.png",
                height: 36,
                width: 36,
              ),

              const SizedBox(width: 6),

              Text(
                "CarePaws",
                style: AppTextStyles.h1.copyWith(
                  fontSize: 28, // keep exact as you want
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4A3426),
                ),
              ),
            ],
          ),

          const Spacer(),

          /// 📍 LOCATION DROPDOWN
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(

                value: selectedLocation,

                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff6B4B35),
                ),

                items: locations.map((loc) {
                  return DropdownMenuItem(
                    value: loc,
                    child: Row(
                      children: [

                        /// PNG LOCATION ICON
                        Image.asset(
                          "assets/icons/location.png",
                          height: 24,
                          width: 24,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          loc,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff4A3426),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                onChanged: (value){
                  setState(() {
                    selectedLocation = value!;
                  });
                },

                /// 👇 Selected item UI
                selectedItemBuilder: (context) {
                  return locations.map((loc) {
                    return Row(
                      children: [

                        Image.asset(
                          "assets/icons/location.png",
                          height: 16,
                          width: 16,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          loc,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff4A3426),
                          ),
                        ),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          ),

          const SizedBox(width: 10),

          /// 🔔 NOTIFICATION PNG
          Image.asset(
            "assets/icons/notification.png",
            height: 28,
            width: 25.33,
          ),

        ],
      ),
    );
  }
}