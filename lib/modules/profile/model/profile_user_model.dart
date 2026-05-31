enum ProfileUserRole { user, doctor, rescuer }

class ProfileUserModel {
  final String name;
  final String email;
  final String imageUrl;

  final bool isDoctor;
  final bool isRescuer;

  final ProfileUserRole currentRole;

  ProfileUserModel({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.isDoctor,
    required this.isRescuer,
    required this.currentRole,
  });

  ProfileUserModel copyWith({
    ProfileUserRole? currentRole,
  }) {
    return ProfileUserModel(
      name: name,
      email: email,
      imageUrl: imageUrl,
      isDoctor: isDoctor,
      isRescuer: isRescuer,
      currentRole: currentRole ?? this.currentRole,
    );
  }
}