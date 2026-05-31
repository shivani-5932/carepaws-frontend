import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/home/widget/home_carousel_widget.dart';
import 'package:care_paws/modules/home/widget/home_topbar_widget.dart';
import 'package:care_paws/modules/home/widget/service_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import '../../community/widget/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFCFA), // 👈 top base white

      body: SafeArea(
          child: Column(
            children: [

              /// 🔝 TOP WHITE SECTION
               Container(
                  color: Color(0xFFFDFCFA),
                  child: Column(
                    children: [
                      const HomeTopBarWidget(),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SearchBarWidget(
                          controller: TextEditingController(),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),


              /// 🔽 GRADIENT SECTION (SCROLLABLE)
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffF6F1EB), // lighter top
                        Color(0xffE9DDD2), // soft beige bottom
                      ],
                    ),
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const HomeCarouselWidget(),

                        const SizedBox(height: 14),

                        /// ✨ TEXT (Playfair from theme)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            child: Column(
                              children: [
                            Center(
                            child: Text(
                            "Care Beyond Companionship",
                              style: AppTextStyles.h2.copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff4A3426),
                              ),
                            ),
                          ),



                                            const SizedBox(height: 18),

                                            const ServicesGridWidget(),

                                            const SizedBox(height: 24),

                                            Center(
                                              child: Text(
                                                "Made with 🤎",
                                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xff8B6F5A),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(height: 20),

                              ],
                            ),

                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],

          ),
        ),


      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}