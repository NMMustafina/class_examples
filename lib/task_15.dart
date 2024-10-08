/* Задача 15: Абстрактный класс "Shape" (Форма)
Описание задачи:

Создай абстрактный класс Shape, который будет представлять геометрическую фигуру.

Поля:
Не требуются, так как это базовый абстрактный класс.
Методы:
Абстрактный метод area() — метод для вычисления площади фигуры.
Абстрактный метод perimeter() — метод для вычисления периметра фигуры.
Класс должен быть абстрактным, чтобы указать, что он служит только в качестве базового для других классов и не может быть использован для создания объектов напрямую.
Создай подклассы, которые будут наследоваться от класса Shape и реализовывать конкретные формы:

Класс Circle (Окружность):
Поля:
radius (число с плавающей точкой) — радиус окружности.
Реализуй методы:
area() — возвращает площадь круга по формуле: 𝜋 × radius^2.
perimeter() — возвращает длину окружности по формуле: 2 × π × radius.
Класс Rectangle (Прямоугольник):
Поля:
width (число с плавающей точкой) — ширина прямоугольника.
height (число с плавающей точкой) — высота прямоугольника.
Реализуй методы:
area() — возвращает площадь прямоугольника по формуле: width×height.
perimeter() — возвращает периметр прямоугольника по формуле: 2×(width+height).
Создай в main() несколько объектов классов Circle и Rectangle и вызови методы area() и perimeter() для каждой фигуры, чтобы вычислить площадь и периметр.

Дополнительно:

Можешь добавить третий подкласс, например, Triangle (Треугольник), и реализовать для него методы area() и perimeter() в зависимости от типа треугольника (например, для равностороннего или прямоугольного).
Цель: Закрепить использование абстрактных классов и методы, которые должны быть реализованы в подклассах. Эта задача помогает понять, как абстрактный класс может служить шаблоном для других классов, которые обязаны реализовать определенные методы. */

import 'dart:math';

void main() {
  Circle circle = Circle(radius: 15);
  Rectangle rectangle = Rectangle(width: 10, height: 15);
  Triangle triangle = Triangle(a: 5, b: 7, c: 3);

  circle.area();
  circle.perimeter();
  rectangle.area();
  rectangle.perimeter();
  triangle.area();
  triangle.perimeter();
}

abstract class Shape {
  void area();
  void perimeter();
}

class Circle extends Shape {
  double radius;

  Circle({required this.radius});

  @override
  void area() => print('Площадь круга: ${3.1416 * radius * radius}');

  @override
  void perimeter() => print("Длина окружности: ${2 * 3.1416 * radius}");
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle({required this.width, required this.height});

  @override
  void area() => print('Площадь прямоугольника: ${width * height}');

  @override
  void perimeter() => print("Периметр прямоугольника: ${2 * (width + height)}");
}

class Triangle extends Shape {
  double a;
  double b;
  double c;

  Triangle({required this.a, required this.b, required this.c});

  @override
  void area() {
    if (a == b && a == c) {
      print('Площадь равностороннего треугольника: ${(sqrt(3) / 4) * a * a}');
    } else {
      double p = (a + b + c) / 2;
      print('Площадь треугольника: ${sqrt(p * (p - a) * (p - b) * (p - c))}');
    }
  }

  @override
  void perimeter() {
    if (a == b && a == c) {
      print("Периметр равностороннего треугольника: ${3 * a}");
    } else {
      print("Периметр треугольника: ${a + b + c}");
    }
  }
}
