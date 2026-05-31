// import 'package:care_paws/modules/community/widget/contrast_button.dart';
// import 'package:care_paws/modules/community/widget/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../controller/onboarding_controller.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => OnboardingController()..startAutoSlide(),
//       child: const _OnboardingView(),
//     );
//   }
// }
//
// class _OnboardingView extends StatelessWidget {
//   const _OnboardingView();
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = context.watch<OnboardingController>();
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: controller.pageController,
//             physics: controller.currentIndex ==
//                 controller.pages.length - 1
//                 ? const NeverScrollableScrollPhysics()
//                 : const BouncingScrollPhysics(),
//             itemCount: controller.pages.length,
//             onPageChanged: controller.onPageChanged,
//             itemBuilder: (context, index) {
//               final page = controller.pages[index];
//
//               if (page.isLast) {
//                 return _GetStartedView(
//                   image: page.image,
//                   onTap: () => controller.onGetStarted(context),
//                 );
//               }
//
//               return _OnboardPage(page: page);
//             },
//           ),
//
//           /// ✅ Skip Button (Updated UI)
//           if (controller.currentIndex < controller.pages.length - 1)
//             Positioned(
//               top: 50,
//               right: 20,
//               child: InkWell(
//                 onTap: () => controller.pageController.jumpToPage(
//                   controller.pages.length - 1,
//                 ),
//                 child: Container(
//                   width: 57,
//                   height: 30,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF3E9E2),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const Text(
//                     "Skip",
//                     style: TextStyle(
//                       color: Color(0xff6B4B35),
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//           /// ✅ Bottom Controls (Updated UI)
//           if (controller.currentIndex < controller.pages.length - 1)
//             Positioned(
//               bottom: 20,
//               left: 20,
//               right: 20,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       controller.pages.length - 1,
//                           (index) => _dot(
//                         active: controller.currentIndex == index,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   PrimaryButton(
//                     text: "Next",
//                     onTap: () {
//                       final nextPage = controller.currentIndex + 1;
//
//                       if (nextPage < controller.pages.length) {
//                         controller.pageController.animateToPage(
//                           nextPage,
//                           duration: const Duration(milliseconds: 400),
//                           curve: Curves.easeInOut,
//                         );
//                       }
//                     },
//                   )
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   /// ✅ Dots Updated
//   Widget _dot({required bool active}) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(horizontal: 3),
//       height: 6,
//       width: active ? 18 : 6,
//       decoration: BoxDecoration(
//         color: active
//             ? const Color(0xff6B4B35)
//             : const Color(0xffD7C2B2),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
//
// class _OnboardPage extends StatelessWidget {
//   final dynamic page;
//   const _OnboardPage({required this.page});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 6,
//           child: Image.asset(
//             page.image,
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//         ),
//
//         /// ✅ Bottom Sheet UI Updated
//         Expanded(
//           flex: 4,
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 24, vertical: 26),
//             decoration: const BoxDecoration(
//               color: Color(0xFFF5EEE9),
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(30),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   page.title,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xff4A3426),
//                   ),
//                 ),
//                 const SizedBox(height: 14),
//                 Text(
//                   page.description,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 13,
//                     height: 1.6,
//                     color: Color(0xff8B6F5A),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class _GetStartedView extends StatelessWidget {
//   final String image;
//   final VoidCallback onTap;
//
//   const _GetStartedView({
//     required this.image,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Image.asset(image, fit: BoxFit.cover),
//         ),
//         Positioned(
//           bottom: 40,
//           left: 20,
//           right: 20,
//           child: ContrastButton(
//             text: "Get Started",
//             onTap: onTap,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingController()..startAutoSlide(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OnboardingController>();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            physics: controller.currentIndex ==
                controller.pages.length - 1
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            itemCount: controller.pages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              final page = controller.pages[index];

              if (page.isLast) {
                return _GetStartedView(
                  image: page.image,
                  onTap: () => controller.onGetStarted(context),
                );
              }

              return _OnboardPage(page: page);
            },
          ),

          // Skip Button (hide on last)
          if (controller.currentIndex < controller.pages.length - 1)
            Positioned(
              top: 50,
              right: 20,
              child: InkWell(
                onTap: () =>
                    controller.pageController.jumpToPage(
                      controller.pages.length - 1,
                    ),
                child: Container(
                  width: 57,
                  height: 36 ,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
            ),

          // Bottom Controls (hide on last)
          if (controller.currentIndex < controller.pages.length - 1)
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.pages.length - 1,
                          (index) => _dot(
                        active: controller.currentIndex == index,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: "Next",
                    onTap: () {
                      // action
                      final nextPage = controller.currentIndex + 1;

                      if (nextPage < controller.pages.length) {
                        controller.pageController.animateToPage(
                          nextPage,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _dot({required bool active}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 7,
      width: active ? 22 : 7,
      decoration: BoxDecoration(
        color: active ? const Color(0xff6B4B35) : Colors.brown.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  final dynamic page;
  const _OnboardPage({required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Image.asset(
            page.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(26)),
            ),
            child: Column(
              children: [
                Text(
                  page.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GetStartedView extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const _GetStartedView({
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(image, fit: BoxFit.cover),
        ),

        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: ContrastButton(
            text: "Get Started",
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}