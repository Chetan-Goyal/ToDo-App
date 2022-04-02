import 'package:flutter/material.dart';

class ToggleIconButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback callback;

  const ToggleIconButton({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: callback,
      icon: Container(
        // padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: isSelected ? Colors.blue : Colors.transparent,
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
