import 'package:emori/utilities/auth_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T?> onChanged;

  // ignore: use_key_in_widget_constructors
  const ContainerButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customContainerButton,
          ],
        ),
      ),
    );
  }

  Widget get _customContainerButton {
    final isSelected = value == groupValue;
    return Container(
      width: 330,
      height: 120,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: isSelected ? kActiveYellow : null,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? kActiveYellow : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? kActiveGreen : kActiveYellow,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
