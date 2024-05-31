import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/utils/show_snack_bar.dart';
import 'package:whatsapp_clone/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<void> signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      authRepository.signInWithPhone(context, phoneNumber);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
