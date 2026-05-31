import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:care_paws/modules/doctor/appointments/model/appointment_model.dart';
import 'package:care_paws/modules/profile/apc/model/profile_appointment_model.dart';
import 'package:flutter/material.dart';

class ProfileAppointmentCard extends StatelessWidget {
  final ProfileAppointmentModel data;

  const ProfileAppointmentCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileAvatarWidget(
                image: "assets/images/doctor.png",
                size: 64,
              ),

              const SizedBox(width: 12),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.doctorName,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      data.specialization,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),

                    Text(
                      data.experience,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
              ),
            ],
          ),

                    const SizedBox(height: 10),

                    /// Date
                    Text(
                      data.dateTime,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// Call / Visit Type
                    Text(
                      data.type,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// Price
                    Text(
                      data.price,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


        ],
      ),
    );
  }
}