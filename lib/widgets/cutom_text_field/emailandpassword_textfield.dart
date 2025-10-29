import 'package:flutter/material.dart';

class EmailandPasswordTextfield extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  bool isPassword;
  EmailandPasswordTextfield({super.key, required controller, this.isPassword = false, });

  @override
  State<EmailandPasswordTextfield> createState() => _EmailTextfieldState();
}

class _EmailTextfieldState extends State<EmailandPasswordTextfield> {
  bool isHidden = false;
  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHidden,
      controller: widget.controller ,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        fillColor: Colors.grey[200],
        hintText: widget.isPassword == true ? "Password" : "Email",
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  toggleVisibility();
                },
                icon: isHidden
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              )
            : null,  
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
