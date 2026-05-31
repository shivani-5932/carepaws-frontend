import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class FilterBottomBarWidget extends StatelessWidget {

  final VoidCallback onClear;
  final VoidCallback onApply;

  const FilterBottomBarWidget({
    super.key,
    required this.onClear,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(12),

        child: Row(
          children: [

            Expanded(
              child: ContrastButton(
                text: "Clear",
                onTap: onClear,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: PrimaryButton(
                text: "Apply",
                onTap: onApply
              )
            ),
          ],
        ),
      ),
    );
  }
}