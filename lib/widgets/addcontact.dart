import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../models/contact_model.dart';

class AddContactBottomSheet extends StatefulWidget {
  final Function(ContactModel) onAdd;

  const AddContactBottomSheet({super.key, required this.onAdd});

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {TextInputType type = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: type,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF1E2A3A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [

              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFF29384D),
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(_selectedImage!, fit: BoxFit.cover),
                  )
                      : Lottie.asset(
                    'assets/animations/image_picker.json',
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _nameController.text.isNotEmpty
                          ? _nameController.text
                          : 'User Name',
                      style: const TextStyle(
                          color: Color(0xFFFFF1D4),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const Divider(color: Colors.white54, thickness: 1),
                    Text(
                      _emailController.text.isNotEmpty
                          ? _emailController.text
                          : 'example@email.com',
                      style: const TextStyle(
                        color: Color(0xFFFFF1D4),
                        fontSize: 14,
                      ),
                    ),
                    const Divider(color: Colors.white54, thickness: 1),
                    Text(
                      _phoneController.text.isNotEmpty
                          ? _phoneController.text
                          : '+200000000000',
                      style: const TextStyle(
                        color: Color(0xFFFFF1D4),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildTextField(_nameController, 'Enter user name'),
          const SizedBox(height: 12),
          _buildTextField(_emailController, 'Enter user email',
              type: TextInputType.emailAddress),
          const SizedBox(height: 12),
          _buildTextField(_phoneController, 'Enter user phone',
              type: TextInputType.phone),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF1D4),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _phoneController.text.isEmpty) return;

                widget.onAdd(ContactModel(
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  image: _selectedImage,
                ));

                _nameController.clear();
                _emailController.clear();
                _phoneController.clear();
                _selectedImage = null;

                Navigator.pop(context);
              },
              child: const Text('Enter User'),
            ),
          ),
        ],
      ),
    );
  }
}