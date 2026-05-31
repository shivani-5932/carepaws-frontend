import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/custom_dropdown.dart';
import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/option_chip.dart';
import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/progress_bar.dart';
import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/time_picker_field.dart';
import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class OtherDetails3 extends StatefulWidget {
  const OtherDetails3({super.key});

  @override
  State<OtherDetails3> createState() => _OtherDetails3State();
}

class _OtherDetails3State extends State<OtherDetails3> {

  /// DAYS
  List<String> selectedDays = [];

  /// SCHEDULE
  String selectedSchedule = "";

  /// WORKING HOURS
  String fromTime = "09 : 41 AM";
  String toTime = "09 : 41 AM";

  /// BREAK
  bool hasBreak = false;
  String breakFrom = "09 : 41 AM";
  String breakTo = "09 : 41 AM";

  /// CLINIC
  bool hasClinic = false;
  String clinicFrom = "09 : 41 AM";
  String clinicTo = "09 : 41 AM";

  final days = ["Mon", "Tue", "Wed", "Thurs", "Fri"];
  final schedules = ["Morning", "Afternoon", "Evening", "Night"];

  /// TIME PICKER
  Future<void> pickTime(
      bool isFrom, {
        bool isBreak = false,
        bool isClinic = false,
      }) async {

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {

      final formatted =
          "${time.hour} : ${time.minute} ${time.period.name.toUpperCase()}";

      setState(() {

        if (isClinic) {
          if (isFrom) {
            clinicFrom = formatted;
          } else {
            clinicTo = formatted;
          }
        }

        else if (isBreak) {
          if (isFrom) {
            breakFrom = formatted;
          } else {
            breakTo = formatted;
          }
        }

        else {
          if (isFrom) {
            fromTime = formatted;
          } else {
            toTime = formatted;
          }
        }

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF7F4F2),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 10),

              const TopProgressBar(step: 3),

              const SizedBox(height: 20),

              /// AVAILABILITY DAYS
              const Text(
                "Availability Days",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                children: days.map((day) {
                  return SelectChip(
                    text: day,
                    isSelected: selectedDays.contains(day),
                    onTap: () {
                      setState(() {
                        selectedDays.contains(day)
                            ? selectedDays.remove(day)
                            : selectedDays.add(day);
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              /// DAILY SCHEDULE
              const Text(
                "Daily Schedule",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                children: schedules.map((e) {
                  return SelectChip(
                    text: e,
                    isSelected: selectedSchedule == e,
                    onTap: () {
                      setState(() {
                        selectedSchedule = e;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              /// WORKING HOURS
              const Text(
                "Working Hours",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TimeBox(
                      value: fromTime,
                      onTap: () => pickTime(true),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TimeBox(
                      value: toTime,
                      onTap: () => pickTime(false),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              const Text(
                "Note: We'll auto generate 30-min consultation slots based on your timings",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// BREAK TIME
              Row(
                children: [
                  const Text("Break Time ?"),
                  const SizedBox(width: 20),

                  SelectChip(
                    text: "Yes",
                    isSelected: hasBreak,
                    onTap: () {
                      setState(() => hasBreak = true);
                    },
                  ),

                  const SizedBox(width: 10),

                  SelectChip(
                    text: "No",
                    isSelected: !hasBreak,
                    onTap: () {
                      setState(() => hasBreak = false);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10),

              if (hasBreak) ...[
                Row(
                  children: [
                    Expanded(
                      child: TimeBox(
                        value: breakFrom,
                        onTap: () => pickTime(true, isBreak: true),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TimeBox(
                        value: breakTo,
                        onTap: () => pickTime(false, isBreak: true),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  "Note: Break will be excluded from bookings",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],

              const SizedBox(height: 20),

              /// HAVE CLINIC
              const Text(
                "Have Clinic ?",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 10),

              Row(
                children: [

                  SelectChip(
                    text: "Yes",
                    isSelected: hasClinic,
                    onTap: () {
                      setState(() => hasClinic = true);
                    },
                  ),

                  const SizedBox(width: 10),

                  SelectChip(
                    text: "No",
                    isSelected: !hasClinic,
                    onTap: () {
                      setState(() => hasClinic = false);
                    },
                  ),
                ],
              ),

              if (hasClinic) ...[

                const SizedBox(height: 20),

                /// LOCATION
                const Text(
                  "Clinic Location",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 8),

                CustomDropdownField(
                  hint: "Location",
                  value: "",
                  onTap: () {},
                ),

                const SizedBox(height: 20),

                /// TIMINGS
                const Text(
                  "Clinic Timings",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const SizedBox(
                      width: 70,
                      child: Text("Opens"),
                    ),
                    Expanded(
                      child: TimeBox(
                        value: clinicFrom,
                        onTap: () => pickTime(true, isClinic: true),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const SizedBox(
                      width: 70,
                      child: Text("Closes"),
                    ),
                    Expanded(
                      child: TimeBox(
                        value: clinicTo,
                        onTap: () => pickTime(false, isClinic: true),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// UPLOAD BUTTON
                ContrastButton(
                  text: "Upload Clinic Documents",
                  onTap: () {
                    Navigator.pushNamed(context, '/clinicDocs');
                  },
                ),
              ],

              const SizedBox(height: 30),

              /// NEXT BUTTON
              PrimaryButton(
                text: "Next",
                onTap: () {
                  Navigator.pop(context, true);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}