import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool selected;
  final bool allPastel;
  final Color color;

  const MenuButton({
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.color,
    this.selected = false,
    this.allPastel = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final baseTextColor = Colors.black87;
    final iconFill = selected ? Colors.white : color;
    final iconBackground = selected
        ? Colors.white.withAlpha(220)
        : allPastel
        ? color.withAlpha(80)
        : color.withAlpha(60);
    final selectedBackground = color.withAlpha(130);
    final backgroundColor = selected
        ? selectedBackground
        : allPastel
        ? color.withAlpha(55)
        : color.withAlpha(40);
    final borderColor = selected
        ? color.withAlpha(140)
        : allPastel
        ? color.withAlpha(100)
        : color.withAlpha(80);
    final cardDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: backgroundColor,
      border: Border.all(color: borderColor),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.06),
          blurRadius: 18,
          offset: Offset(0, 10),
        ),
      ],
    );

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return color.withAlpha(90);
          }
          return color.withAlpha(40);
        }),
        child: Container(
          decoration: cardDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: iconFill, size: 28),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: baseTextColor,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: selected ? Colors.white70 : Colors.black38,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
