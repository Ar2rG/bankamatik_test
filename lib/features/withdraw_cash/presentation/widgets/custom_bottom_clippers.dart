import 'package:flutter/material.dart';

class FirstBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.37) // Левая вертикальная линия
      ..cubicTo(width * 0.20, height * 0.33, width * 0.40, height * 0.85, width,
          height * 0.60)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.50) // Левая вертикальная линия
      ..cubicTo(width * 0.40, height * 0.10, width * 0.80, height * 0.70, width,
          height * 0.65)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ThirdBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.40) // Левая вертикальная линия
      ..cubicTo(width * 0.30, height * 0.95, width * 0.40, height * 0.35, width,
          height * 0.35)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class FourthBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.1) // Левая вертикальная линия
      ..cubicTo(width * 0.20, height * 0.75, width * 0.50, height * 0.15, width,
          height * 0.63)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AllBottomClippers extends StatelessWidget {
  const AllBottomClippers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ThirdBottomClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.4),
              Color.fromRGBO(108, 24, 164, 0.4),
            ])),
          ),
        ),
        ClipPath(
          clipper: FirstBottomClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.7),
              Color.fromRGBO(108, 24, 164, 0.7),
            ])),
          ),
        ),
        ClipPath(
          clipper: FourthBottomClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(56, 39, 180, 0.2),
              Color.fromRGBO(108, 24, 164, 0.2),
            ])),
          ),
        ),
        ClipPath(
          clipper: SecondBottomClipper(),
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
