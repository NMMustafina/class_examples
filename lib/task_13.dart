/* Задача 13: Наследование — класс "Employee" и подклассы "Programmer" и "Designer"
Описание задачи:

Создай базовый класс Employee, который будет представлять работника.

Поля:
name (строка) — имя работника.
salary (число с плавающей точкой) — зарплата работника.
Методы:
work() — базовый метод, который выводит сообщение: "<name> выполняет свою работу."
Конструктор должен принимать имя и зарплату и инициализировать эти поля.
Создай подкласс Programmer, который наследуется от класса Employee.

Поля:
В данном случае можно использовать только наследуемые поля (например, не добавлять новые поля).
Методы:
Переопредели метод work(), чтобы он выводил сообщение: "<name> пишет код."
Создай подкласс Designer, который также наследуется от класса Employee.

Поля:
Также можно использовать только наследуемые поля.
Методы:
Переопредели метод work(), чтобы он выводил сообщение: "<name> создает дизайн."
Создай в main() несколько объектов классов Programmer и Designer, вызови метод work() для каждого объекта, чтобы проверить, как они работают.

Дополнительно:

Добавь методы для изменения зарплаты (setSalary) и получения текущей зарплаты (getSalary).
Реализуй метод для вычисления премии. Например, 10% от текущей зарплаты. Этот метод может быть одинаковым для всех работников.
Цель: Закрепить концепции наследования и полиморфизма. Важно понять, как можно переопределять методы в подклассах, сохраняя общую структуру базового класса. */

void main() {
  Programmer alex = Programmer(name: 'Алекс', salary: 1000);
  Designer marti = Designer(name: 'Марти', salary: 700);

  alex.work();
  marti.work();
  alex.setSalary(1200);
  marti.setSalary(900);
  alex.getSalary();
  marti.getSalary();
  alex.setBonus();
  marti.setBonus();
}

class Employee {
  String name;
  double salary;

  Employee({required this.name, required this.salary});

  void work() {
    print('$name выполняет свою работу.');
  }

  void setSalary(double newSalary) {
    salary = newSalary;
  }

  void getSalary() {
    print('У $name текущая зарплата: $salary');
  }

  void setBonus() {
    double bonus = salary / 10;
    print('Зарплата: $salary. Премия: $bonus');
  }
}

class Programmer extends Employee {
  Programmer({required super.name, required super.salary});

  @override
  void work() {
    print('$name пишет код.');
  }
}

class Designer extends Employee {
  Designer({required super.name, required super.salary});

  @override
  void work() {
    print('$name создает дизайн.');
  }
}
