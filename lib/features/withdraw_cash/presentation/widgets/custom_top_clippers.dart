import 'package:flutter/material.dart';

class FirstTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.43) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.50,
          height * 0.35,
          // x2, y2
          width * 0.65,
          height * 0.62,
          // x3, y3
          width,
          height * 0.55)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.40) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.50,
          height * 0.45,
          // x2, y2
          width * 0.80,
          height * 0.80,
          // x3, y3
          width,
          height * 0.50)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ThirdTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.60) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.50,
          height * 0.62,
          // x2, y2
          width * 0.55,
          height * 0.32,
          // x3, y3
          width,
          height * 0.49)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class FourthTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.44) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.40,
          height * 0.75,
          // x2, y2
          width * 0.75,
          height * 0.45,
          // x3, y3
          width,
          height * 0.65)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AllTopClippers extends StatelessWidget {
  const AllTopClippers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: FourthTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.2),
              Color.fromRGBO(56, 39, 180, 0.2),
            ])),
          ),
        ),
        ClipPath(
          clipper: ThirdTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.4),
              Color.fromRGBO(56, 39, 180, 0.7),
            ])),
          ),
        ),
        ClipPath(
          clipper: SecondTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(56, 39, 180, 0.7),
              Color.fromRGBO(108, 24, 164, 0.7),
            ])),
          ),
        ),
        ClipPath(
          clipper: FirstTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(56, 39, 180, 0.7),
              Color.fromRGBO(108, 24, 164, 0.7),
            ])),
          ),
        ),
      ],
    );
  }
}
