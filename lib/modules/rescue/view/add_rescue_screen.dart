import 'package:care_paws/modules/rescue/controller/resue_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/rescue_model.dart';

class AddRescueScreen extends StatefulWidget {
  const AddRescueScreen({super.key});

  @override
  State<AddRescueScreen> createState() => _AddRescueScreenState();
}

class _AddRescueScreenState extends State<AddRescueScreen> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final problemController = TextEditingController();
  final itemsController = TextEditingController();

  String selectedAnimal = "Dog";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              textField("Your Name", nameController),
              const SizedBox(height: 12),

              textField("Your Phone No", phoneController),
              const SizedBox(height: 12),

              textField("Rescue Location", locationController),
              const SizedBox(height: 12),

              /// 🔹 Animal selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["Dog", "Cat", "Exotic"].map((e) {
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedAnimal = e);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedAnimal == e
                              ? Colors.brown
                              : Colors.grey,
                        ),
                      ),
                      child: Text(e),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 12),

              textField("Problem", problemController),
              const SizedBox(height: 12),

              textField("Items needed urgently", itemsController),

              const Spacer(),

              /// 🔥 ADD BUTTON
              GestureDetector(
                onTap: () {

                  final rescue = RescueModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    location: locationController.text,
                    animal: selectedAnimal,
                    problem: problemController.text,
                    items: itemsController.text,
                  );

                  Provider.of<RescueController>(context, listen: false)
                      .addRescue(rescue);

                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B5E57),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}