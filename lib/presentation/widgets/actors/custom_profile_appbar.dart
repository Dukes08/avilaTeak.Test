import 'package:avilatek_test/domain/entities/actor.dart';
import 'package:flutter/material.dart';

class CustomProfileAppbar extends StatelessWidget {
  final Actor actor;

  const CustomProfileAppbar({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      expandedHeight: 200, // Más espacio para el contenido
      leading: IconButton(
        icon: Image.asset(
          'assets/images/back_arrow.png',
          width: 30,
          height: 30,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 120.0, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📷 Foto del actor
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  actor.profilePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // 📌 Nombre + Biografía (Ahora con flexibilidad)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      actor.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 250,
                      child: Text(
                        actor.biography?.isNotEmpty == true
                            ? actor.biography!
                            : 'Sin biografía disponible.',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
