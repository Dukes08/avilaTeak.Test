import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? icon;
  final VoidCallback? onBackPressed;

  const CustomAppbar({
    super.key,
    this.title,
    this.icon,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                onPressed: onBackPressed ?? () {},
                icon: Image.asset(
                  icon ?? 'assets/images/burger_menu.png',
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 101),
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalooBhaijaan2',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(56.0); // Ajusta la altura según tus necesidades
}
