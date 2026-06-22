import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';

const String userName = 'Areeba';
const String userAge = '21';
const String userBloodGroup = 'O+';
const String userEmergencyContact = '+92 300 0000000';
const String userPatientId = 'MP-88234-PK';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF1D4ED8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1D4ED8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Manage your personal health profile and emergency details.',
                          style: TextStyle(
                            color: Color(0xFFE2E8F0),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Profile details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),
            CustomInfoCard(
              title: 'Name',
              value: userName,
              icon: Icons.person_outline,
            ),
            CustomInfoCard(
              title: 'Age',
              value: userAge,
              icon: Icons.cake_outlined,
            ),
            CustomInfoCard(
              title: 'Blood Group',
              value: userBloodGroup,
              icon: Icons.bloodtype_outlined,
            ),
            CustomInfoCard(
              title: 'Emergency Contact',
              value: userEmergencyContact,
              icon: Icons.call_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
