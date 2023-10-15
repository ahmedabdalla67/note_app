import 'package:flutter/material.dart';
import 'package:note_app/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.isLoaging = false,
  });
  final void Function()? onTap;
  final bool isLoaging;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        child: isLoaging
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : const Center(
                child: Text(
                'Add',
                style: TextStyle(color: Colors.black),
              )),
      ),
    );
  }
}
