/* Задача 22: Паттерн "Фабричный метод" для создания объектов "Транспорт"
Описание задачи:

Создай абстрактный класс Transport, который будет представлять общий интерфейс для всех видов транспорта.

Поля и методы могут включать:
Поле name (строка) — название транспорта.
Метод move() — абстрактный метод, который будет реализован в конкретных подклассах и определять способ передвижения транспорта (например, на дороге, по рельсам или в воздухе).
Создай конкретные подклассы для каждого вида транспорта:

Класс Car (Машина):
Реализует метод move() с сообщением о том, что машина передвигается по дороге.
Класс Train (Поезд):
Реализует метод move() с сообщением о том, что поезд передвигается по рельсам.
Класс Airplane (Самолет):
Реализует метод move() с сообщением о том, что самолет летит в воздухе.
Создай абстрактный класс TransportFactory:

Этот класс будет определять фабричный метод для создания транспорта.
Определи абстрактный метод createTransport(), который будет возвращать объект типа Transport.
Создай конкретные фабрики для каждого типа транспорта:

Класс CarFactory:
Реализует метод createTransport(), возвращающий объект типа Car.
Класс TrainFactory:
Реализует метод createTransport(), возвращающий объект типа Train.
Класс AirplaneFactory:
Реализует метод createTransport(), возвращающий объект типа Airplane.
Использование фабричного метода:

Создай объекты каждого типа фабрики (CarFactory, TrainFactory, AirplaneFactory).
Используй метод createTransport() для создания конкретных объектов транспорта.
Для каждого созданного объекта транспорта вызови метод move(). */

void main() {
  CarFactory carFactory = CarFactory();
  TrainFactory trainFactory = TrainFactory();
  AirplaneFactory airplaneFactory = AirplaneFactory();

  Transport car = carFactory.createTransport();
  Transport train = trainFactory.createTransport();
  Transport airplane = airplaneFactory.createTransport();

  car.move();
  train.move();
  airplane.move();
}

abstract class Transport {
  String name;
  Transport(this.name);

  void move();
}

class Car extends Transport {
  Car(String name) : super(name);

  @override
  void move() {
    print('$name передвигается по дороге');
  }
}

class Train extends Transport {
  Train(String name) : super(name);

  @override
  void move() {
    print('$name передвигается по рельсам');
  }
}

class Airplane extends Transport {
  Airplane(String name) : super(name);

  @override
  void move() {
    print('$name летит в воздухе');
  }
}

abstract class TransportFactory {
  Transport createTransport();
}

class CarFactory extends TransportFactory {
  @override
  Car createTransport() => Car('машина');
}

class TrainFactory extends TransportFactory {
  @override
  Train createTransport() => Train('поезд');
}

class AirplaneFactory extends TransportFactory {
  @override
  Airplane createTransport() => Airplane('самолет');
}
