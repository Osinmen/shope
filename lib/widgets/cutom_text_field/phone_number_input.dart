import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// Add to pubspec.yaml:
// dependencies:
//   intl_phone_field: ^3.2.0

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  PhoneNumberInput({super.key, required this.controller});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'Your number',
        hintStyle: const TextStyle(color: Color(0xFF999999), fontSize: 16),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
      initialCountryCode: 'NG', // Default to UK
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Color(0xFF666666),
      ),
      flagsButtonPadding: const EdgeInsets.only(left: 8),
      showCountryFlag: true,
      showDropdownIcon: true,
      style: const TextStyle(fontSize: 16, color: Color(0xFF333333)),
      dropdownTextStyle: const TextStyle(
        fontSize: 16,
        color: Color(0xFF333333),
      ),
      onChanged: (phone) {
        print('Complete number: ${phone.completeNumber}');
        print('Country code: ${phone.countryCode}');
        print('Number: ${phone.number}');
      },
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
    );
  }
}
