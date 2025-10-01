import 'package:flutter/material.dart';
import '../../../routes/router.dart';
import '../../../services/auth/authService.dart';
import '../widgets/edicion/profile_avatar.dart';
import '../widgets/edicion/edit_header_text.dart';
import '../widgets/edicion/name_input_field.dart';
import '../widgets/edicion/password_input_field.dart';
import '../widgets/edicion/error_message_box.dart';
import '../widgets/edicion/update_button.dart';

class NameEditView extends StatefulWidget {
  const NameEditView({Key? key}) : super(key: key);

  @override
  State<NameEditView> createState() => _NameEditViewState();
}

class _NameEditViewState extends State<NameEditView> {
  final nameCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool isLoading = false;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final user = await AppRouter.user.getById(AuthService.userId!);
      if (user != null && mounted) {
        nameCtrl.text = user.name;
      }
    } catch (e) {
      if (mounted) {
        setState(() => error = 'Error al cargar datos');
      }
    }
  }

  Future<void> _updateName() async {
    setState(() => error = '');
    
    if (!_formKey.currentState!.validate()) return;

    final name = nameCtrl.text.trim();
    final pass = passCtrl.text.trim();

    setState(() => isLoading = true);

    try {
      final success = await AppRouter.user.updateNameSecure(pass, name);
      
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Nombre actualizado correctamente'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else {
          passCtrl.clear();
          setState(() {
            error = 'Contraseña incorrecta';
            isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          error = 'Error al actualizar nombre';
          isLoading = false;
        });
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() => obscurePassword = !obscurePassword);
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          'Editar perfil',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                const ProfileAvatar(),
                const SizedBox(height: 32),
                const EditHeaderText(),
                const SizedBox(height: 32),
                NameInputField(controller: nameCtrl),
                const SizedBox(height: 16),
                PasswordInputField(
                  controller: passCtrl,
                  obscurePassword: obscurePassword,
                  onToggleVisibility: _togglePasswordVisibility,
                ),
                const SizedBox(height: 24),
                if (error.isNotEmpty) ...[
                  ErrorMessageBox(message: error),
                  const SizedBox(height: 16),
                ],
                UpdateButton(
                  isLoading: isLoading,
                  onPressed: _updateName,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[700],
                  ),
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}