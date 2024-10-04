/* Задача 2: Создание класса "Car"
Описание задачи:

Создай класс Car, который будет представлять автомобиль.
В классе должны быть три поля:
brand (строка) — марка автомобиля.
model (строка) — модель автомобиля.
year (целое число) — год выпуска.
Добавь конструктор, который принимает параметры для всех трёх полей и инициализирует их.
Создай метод, который выводит информацию об автомобиле в формате: "Марка: <brand>, Модель: <model>, Год выпуска: <year>".
Реализуй возможность обновлять поле year, чтобы изменить год выпуска автомобиля после его создания.
Цель: Закрепить работу с полями, конструктором и методами. Важно научиться обновлять значения полей после создания объекта. */

void main() {
  Car mercedes = Car(brand: 'Mercedes', model: 'S63 AMG', year: 2023);
  mercedes.carInfo();

  mercedes.year = 2024;
  mercedes.carInfo();
}

class Car {
  String brand;
  String model;
  int year;

  Car({required this.brand, required this.model, required this.year});

  carInfo() {
    print("Марка: $brand, Модель: $model, Год выпуска: $year");
  }
}
