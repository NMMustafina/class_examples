/* Задача 1: Создание класса "Person"
Описание задачи:

Создай класс Person, который будет представлять человека.
В классе должны быть два поля: name (строковое значение) и age (целое число).
Добавь конструктор, который принимает параметры для имени и возраста, и инициализирует соответствующие поля.
Создай метод, который будет выводить на экран информацию о человеке, в формате: "Имя: <name>, Возраст: <age>".
Цель: Закрепить основы создания классов, конструкторов, полей и методов. */

void main() {
  Person alex = Person(name: 'Alex', age: 25);
  alex.personInfo();
}

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});

  void personInfo() {
    print("Имя: $name, Возраст: $age");
  }
}
