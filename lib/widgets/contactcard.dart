import 'dart:io';
import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;

  const ContactCard({super.key, required this.contact, required this.onDelete});

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
              Container(
                width: double.infinity,
                height: 150,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: contact.image != null
                      ? Image.file(contact.image!, fit: BoxFit.cover)
                      : Image.asset(
                    'assets/images/user_placeholder.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  color: Colors.white.withOpacity(0.8),
                  child: Text(
                    contact.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.email, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(contact.email, style: const TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(contact.phone, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, size: 18),
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