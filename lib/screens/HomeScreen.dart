import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../widgets/contactperview.dart';
import '../widgets/addcontact.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contacts = [];

  void _addContact(ContactModel contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  void _showAddContactSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF29384D),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => AddContactBottomSheet(onAdd: _addContact),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29384D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF29384D),
        elevation: 0,
        title: Image.asset('assets/images/logo.png', width: 150),
      ),
      body: contacts.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/empty_contacts.json',
              width: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              'There is No Contacts Added Here',
              style: TextStyle(color: Color(0xFFFFF1D4), fontSize: 20),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: contacts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactPreview(
            contact: contact,
            onDelete: () {
              setState(() {
                contacts.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contacts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  setState(() {
                    contacts.clear();
                  });
                },
                child: const Icon(Icons.delete),
              ),
            ),
          FloatingActionButton(
            backgroundColor: const Color(0xFFFFF1D4),
            onPressed: _showAddContactSheet,
            child: const Icon(Icons.add, color: Colors.black),
          ),
        ],
      ),
    );
  }
}