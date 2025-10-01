import 'package:flutter/material.dart';

class DecorativeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Estrellas en la parte superior
        Positioned(top: 30, left: 20, 
          child: Icon(Icons.star, color: Colors.cyan, size: 35)),
        Positioned(top: 60, right: 25, 
          child: Icon(Icons.star, color: Color(0xFF2C3E50), size: 30)),
        Positioned(top: 120, left: 15, 
          child: Icon(Icons.star, color: Colors.purple, size: 28)),
        Positioned(top: 90, right: 60, 
          child: Icon(Icons.star, color: Colors.blue.shade700, size: 26)),
        
        // Estrellas en la parte inferior
        Positioned(bottom: 40, left: 30, 
          child: Icon(Icons.star, color: Colors.red, size: 38)),
        Positioned(bottom: 80, right: 40, 
          child: Icon(Icons.star, color: Color(0xFF1A1A2E), size: 35)),
        Positioned(bottom: 120, left: 20, 
          child: Icon(Icons.star, color: Colors.green.shade600, size: 32)),
        Positioned(bottom: 50, right: 70, 
          child: Icon(Icons.star, color: Colors.amber, size: 30)),
        Positioned(bottom: 150, right: 25, 
          child: Icon(Icons.star, color: Colors.teal, size: 28)),
        
        // Estrellas en los laterales (zonas seguras)
        Positioned(top: 250, left: 10, 
          child: Icon(Icons.star, color: Colors.pink.shade300, size: 26)),
        Positioned(top: 350, left: 15, 
          child: Icon(Icons.star, color: Colors.indigo, size: 28)),
        Positioned(top: 300, right: 10, 
          child: Icon(Icons.star, color: Colors.yellow.shade700, size: 24)),
        Positioned(top: 400, right: 15, 
          child: Icon(Icons.star, color: Colors.orange, size: 26)),
        Positioned(top: 450, left: 20, 
          child: Icon(Icons.star, color: Colors.lime.shade700, size: 24)),
        
        // Círculos en esquinas y laterales
        Positioned(
          top: 100, left: 40,
          child: _DecorativeCircle(size: 28, color: Color(0xFF5C4033)),
        ),
        Positioned(
          top: 180, right: 35,
          child: _DecorativeCircle(size: 24, color: Colors.purple.shade800),
        ),
        Positioned(
          bottom: 180, left: 25,
          child: _DecorativeCircle(size: 30, color: Colors.teal.shade700),
        ),
        Positioned(
          bottom: 220, right: 40,
          child: _DecorativeCircle(size: 32, color: Color(0xFF5C4033)),
        ),
        Positioned(
          top: 200, left: 10,
          child: _DecorativeCircle(size: 22, color: Colors.indigo.shade700),
        ),
        Positioned(
          top: 320, right: 8,
          child: _DecorativeCircle(size: 24, color: Colors.orange.shade700),
        ),
        Positioned(
          bottom: 280, left: 12,
          child: _DecorativeCircle(size: 26, color: Colors.green.shade800),
        ),
        Positioned(
          bottom: 100, right: 20,
          child: _DecorativeCircle(size: 22, color: Colors.pink.shade600),
        ),
      ],
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _DecorativeCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}