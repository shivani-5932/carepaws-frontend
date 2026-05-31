import 'package:flutter/material.dart';

class UploadDocumentCard extends StatelessWidget {

  final String label; // Front / Back
  final bool isUploaded;
  final VoidCallback onTap;

  const UploadDocumentCard({
    super.key,
    required this.label,
    required this.isUploaded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 140,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: isUploaded
                ? Colors.green
                : const Color(0xffD2B8A3),
          ),
        ),

        child: Column(
          children: [

            /// TOP AREA
            Expanded(
              child: Center(
                child: isUploaded
                    ? const Text(
                  "Uploaded",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                )
                    : Container(
                  height: 40,
                  width: 40,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff6F4E37),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: const Icon(
                    Icons.add,
                    color: Color(0xff6F4E37),
                  ),
                ),
              ),
            ),

            /// BOTTOM LABEL
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),

              decoration: const BoxDecoration(
                color: Color(0xff8B5E3C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),

              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}