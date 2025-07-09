import 'package:doc_app/core/helpers/spacing.dart';
import 'package:doc_app/core/theming/color_manager.dart';
import 'package:doc_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialCharacters,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lower letter', hasLowerCase),
        verticalSpace(3),
        buildValidationRow('At least 1 upper letter', hasUpperCase),
        verticalSpace(3),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(3),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpace(3),
        buildValidationRow('At least 8 characters', hasMinLength),
      ],
    );
  }

  buildValidationRow(String text, bool hasValidator) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidator ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidator ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
