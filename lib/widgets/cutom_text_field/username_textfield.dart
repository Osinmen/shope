import 'package:flutter/material.dart';

class UsernameTextfield extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  
  UsernameTextfield({super.key, required controller});

  @override
  State<UsernameTextfield> createState() => _EmailTextfieldState();
}

class _EmailTextfieldState extends State<UsernameTextfield> {
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller ,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        fillColor: Colors.grey[200],
        hintText: "Username",

        hintStyle: TextStyle(
          fontSize: 13.83,
          color: Colors.grey[400],
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {

    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30));
  }
}
