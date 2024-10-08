/* Задача 12: Создание иерархии классов "Vehicle" (Транспортное средство)
Описание задачи:

Создай базовый класс Vehicle, который будет представлять транспортное средство.

Поля:
speed (число с плавающей точкой) — максимальная скорость транспортного средства.
capacity (целое число) — вместимость (количество пассажиров).
Методы:
move() — метод, который выводит сообщение о движении транспортного средства с его скоростью.
Конструктор должен принимать и инициализировать поля speed и capacity.
Создай подклассы, которые будут наследоваться от класса Vehicle:

Класс Car (Машина):
Дополнительные поля:
fuelType (строка) — тип топлива (например, "бензин", "электричество").
Дополнительный метод:
refuel() — метод, который выводит сообщение о заправке машины топливом.
Класс Plane (Самолет):
Дополнительные поля:
airline (строка) — название авиакомпании.
Дополнительный метод:
takeOff() — метод, который выводит сообщение о взлете самолета.
Класс Boat (Корабль):
Дополнительные поля:
boatType (строка) — тип судна (например, "яхта", "пароход").
Дополнительный метод:
anchor() — метод, который выводит сообщение о постановке судна на якорь.
В каждом подклассе переопредели метод move(), чтобы он выводил сообщение, соответствующее типу транспортного средства:

Для класса Car сообщение должно указывать на движение по дороге.
Для класса Plane — на полет в небе.
Для класса Boat — на движение по воде.
Создай несколько объектов каждого типа транспорта и вызови методы move, а также специфические методы для каждого подкласса.

Цель: Закрепить концепции наследования и полиморфизма. Научиться создавать общие базовые классы и специфичные подклассы, переопределять методы для конкретных объектов. */

void main() {
  Car car = Car(fuelType: 'Бензин', speed: 100, capacity: 4);
  Plane plane = Plane(airline: 'Аэрофлот', speed: 1000, capacity: 300);
  Boat boat = Boat(boatType: 'Яхта', speed: 50, capacity: 50);

  car.refuel();
  car.move();
  plane.takeOff();
  plane.move();
  boat.anchor();
  boat.move();
}

abstract class Vehicle {
  double speed;
  int capacity;

  Vehicle({required this.speed, required this.capacity});

  void move();
}

class Car extends Vehicle {
  String fuelType;

  Car({required this.fuelType, required super.speed, required super.capacity});

  void refuel() {
    print('Заправка машины топливом $fuelType');
  }

  @override
  void move() {
    print('Машина движется по дороге со скоростью $speed км/ч.');
  }
}

class Plane extends Vehicle {
  String airline;
  Plane({required this.airline, required super.speed, required super.capacity});

  void takeOff() {
    print('Самолет авиакомпании $airline взлетает.');
  }

  @override
  void move() {
    print('Самолет летит со скоростью $speed км/ч.');
  }
}

class Boat extends Vehicle {
  String boatType;

  Boat({required this.boatType, required super.speed, required super.capacity});

  void anchor() {
    print('Судно типа $boatType на якоре.');
  }

  @override
  void move() {
    print('Судно плывет по воде со скоростью $speed км/ч.');
  }
}
