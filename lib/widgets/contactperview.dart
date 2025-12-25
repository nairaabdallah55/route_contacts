import 'dart:io';
import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactPreview extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;

  const ContactPreview({
    super.key,
    required this.contact,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1D4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: contact.image != null
                    ? Image.file(
                  contact.image!,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  'assets/images/user_placeholder.png',
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.white.withOpacity(0.8),
                  child: Text(
                    contact.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.email, size: 16),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        contact.email,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      contact.phone,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}