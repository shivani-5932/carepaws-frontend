import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/appointment_booking/add_pet/widget/common_input_field_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/add_pet/widget/select_option_button.dart';
import 'package:flutter/material.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  String selectedPet = "";
  String selectedGender = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController breed2Controller = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  /// Dummy dropdown data
  final List<String> breeds = ["Labrador", "Husky", "Persian Cat", "Parrot"];

  void showDropdown(List<String> items, TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(items[index]),
              onTap: () {
                controller.text = items[index];
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  /// Date Picker
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2022),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthdayController.text =
      "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// PET NAME
              CommonInputField(
                hint: "Pet Name",
                controller: nameController,
              ),

              const SizedBox(height: 12),

              /// PET TYPE
              Row(
                children: [
                  SelectOptionButton(
                    text: "Dog",
                    isSelected: selectedPet == "Dog",
                    onTap: () {
                      setState(() => selectedPet = "Dog");
                    },
                  ),
                  const SizedBox(width: 10),
                  SelectOptionButton(
                    text: "Cat",
                    isSelected: selectedPet == "Cat",
                    onTap: () {
                      setState(() => selectedPet = "Cat");
                    },
                  ),
                  const SizedBox(width: 10),
                  SelectOptionButton(
                    text: "Exotic",
                    isSelected: selectedPet == "Exotic",
                    onTap: () {
                      setState(() => selectedPet = "Exotic");
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// BREED
              CommonInputField(
                hint: "Choose Pet Breed",
                isDropdown: true,
                controller: breedController,
                onTap: () => showDropdown(breeds, breedController),
              ),

              const SizedBox(height: 12),

              /// GENDER
              Row(
                children: [
                  SelectOptionButton(
                    text: "Male",
                    isSelected: selectedGender == "Male",
                    onTap: () {
                      setState(() => selectedGender = "Male");
                    },
                  ),
                  const SizedBox(width: 10),
                  SelectOptionButton(
                    text: "Female",
                    isSelected: selectedGender == "Female",
                    onTap: () {
                      setState(() => selectedGender = "Female");
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// BREED AGAIN
              CommonInputField(
                hint: "Choose Pet Breed",
                isDropdown: true,
                controller: breed2Controller,
                onTap: () => showDropdown(breeds, breed2Controller),
              ),

              const SizedBox(height: 12),

              /// BIRTHDAY
              CommonInputField(
                hint: "Add Pet Birthday",
                isDropdown: true,
                controller: birthdayController,
                onTap: pickDate,
              ),

              const SizedBox(height: 12),

              /// WEIGHT
              CommonInputField(
                hint: "Enter Pet Weight",
                controller: weightController,
              ),

              const Spacer(),

              /// NEXT BUTTON (same UI)
               PrimaryButton(
                  text: "Next",
                  onTap: () {
                    // action
                    Navigator.pushNamed(context, '/book');
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}