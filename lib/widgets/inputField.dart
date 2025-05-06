import 'package:flutter/material.dart';
import 'package:to_do_app/fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
  });

  final String label;
  final String hintText;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          label,
            style: inputFieldTitle.copyWith(
                fontSize: 19, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: hintText,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
