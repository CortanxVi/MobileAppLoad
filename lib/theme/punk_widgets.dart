import 'package:flutter/material.dart';
import 'package:mobilekakkak/theme/punk_theme.dart';

class PunkTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final IconData prefixIcon;

  const PunkTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PunkBorders.primaryBorder,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: PunkTextStyles.bodyText,
        decoration: PunkInputDecorations.textField(
          labelText: labelText,
          prefixIcon: prefixIcon,
        ),
        cursorColor: PunkColors.primary,
      ),
    );
  }
}

class PunkButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isPrimary;
  final IconData? icon;

  const PunkButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isPrimary = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: isPrimary ? PunkColors.border : PunkColors.borderWhite,
          width: 3,
        ),
        color: isPrimary ? PunkColors.primary : Colors.transparent,
        boxShadow: isPrimary ? PunkShadows.glow : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: isPrimary
              ? Colors.white.withOpacity(0.2)
              : PunkColors.primary.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: isPrimary
                      ? PunkColors.onPrimary
                      : PunkColors.onBackground,
                  size: 24,
                ),
                SizedBox(width: PunkSpacing.sm),
              ],
              Text(
                text,
                style: PunkTextStyles.button.copyWith(
                  color: isPrimary
                      ? PunkColors.onPrimary
                      : PunkColors.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
