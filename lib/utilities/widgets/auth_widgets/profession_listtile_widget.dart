import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:flutter/material.dart';

class ProfessionListTileWidget extends StatelessWidget {
  final String profession;
  final bool isSelected;
  final ValueChanged<String> onSelectedProfession;

  const ProfessionListTileWidget({
    required this.profession,
    required this.isSelected,
    required this.onSelectedProfession,
  });

  @override
  Widget build(BuildContext context) {
    final style = isSelected
        ? const TextStyle(
            fontSize: 18,
            color: kActiveGreen,
            fontWeight: FontWeight.bold,
            fontFamily: 'Readex Pro')
        : const TextStyle(
            fontSize: 18, color: kActiveYellow, fontFamily: 'Readex Pro');

    return Container(
      color: isSelected ? kActiveYellow : kActiveGreen,
      child: ListTile(
        onTap: () => onSelectedProfession(profession),
        title: Text(
          profession,
          style: style,
        ),
        trailing: isSelected
            ? const Icon(Icons.check, color: kActiveGreen, size: 26)
            : null,
      ),
    );
  }
}
