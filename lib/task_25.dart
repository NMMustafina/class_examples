/* Задача 25: Создание иерархии классов "Здание" — подклассы "Школа", "Офис" и "Больница"
Описание задачи:

Создай базовый класс Building (Здание):

Этот класс будет представлять общее поведение и характеристики для всех типов зданий.
Поля класса:
address (строка) — адрес здания.
floors (целое число) — количество этажей.
Методы класса:
showDetails() — виртуальный метод для отображения общей информации о здании (например, адрес и количество этажей). Этот метод будет переопределяться в дочерних классах.
calculateMaintenanceCost() — виртуальный метод для расчета стоимости обслуживания здания.
Создай подклассы School, Office, и Hospital, которые будут наследовать от класса Building и добавлять свою специфическую функциональность:

Класс School:
Дополнительные поля:
numStudents (целое число) — количество студентов.
numTeachers (целое число) — количество учителей.
Специфический метод:
holdClass() — метод, который имитирует проведение занятий (например, вывод сообщения о том, что уроки начались).
Переопредели метод calculateMaintenanceCost() для расчета стоимости обслуживания на основе количества студентов и этажей.
Класс Office:
Дополнительные поля:
numEmployees (целое число) — количество сотрудников.
Специфический метод:
startWorkDay() — метод, который имитирует начало рабочего дня (например, вывод сообщения о начале работы).
Переопредели метод calculateMaintenanceCost() для расчета стоимости обслуживания на основе количества сотрудников и этажей.
Класс Hospital:
Дополнительные поля:
numDoctors (целое число) — количество врачей.
numPatients (целое число) — количество пациентов.
Специфический метод:
admitPatient() — метод, который имитирует прием нового пациента (например, вывод сообщения о том, что пациент был принят).
Переопредели метод calculateMaintenanceCost() для расчета стоимости обслуживания на основе количества пациентов, врачей и этажей.
Полиморфизм:

Создай список объектов типа Building, который будет включать школы, офисы и больницы.
Вызови метод showDetails() для каждого объекта в списке, и каждый объект должен выводить свои уникальные детали, несмотря на то, что все они хранятся в одном списке как объекты базового класса Building. */

void main() {
  School school = School(
      address: 'Школьная, 10', floors: 3, numStudents: 500, numTeachers: 30);
  Office office = Office(address: 'Офисная, 1', floors: 10, numEmployees: 200);
  Hospital hospital = Hospital(
      address: 'Больничная, 20', floors: 5, numDoctors: 50, numPatients: 100);

  List<Building> buildings = [school, office, hospital];

  for (var building in buildings) {
    building.showDetails();
    print('Стоимость обслуживания: ${building.calculateMaintenanceCost()}\n');
  }
}

abstract class Building {
  String address;
  int floors;

  Building({required this.address, required this.floors});

  void showDetails() {
    print('Адрес здания: $address, количество этажей: $floors');
  }

  double calculateMaintenanceCost();
}

class School extends Building {
  int numStudents;
  int numTeachers;

  School(
      {required this.numStudents,
        required this.numTeachers,
        required super.address,
        required super.floors});

  @override
  void showDetails() {
    super.showDetails();
    print('Количество студентов: $numStudents, учителей: $numTeachers');
  }

  @override
  void holdClass() {
    print('Уроки начались');
  }

  @override
  double calculateMaintenanceCost() {
    return (numStudents * 10) + (numTeachers * 20) + (floors * 100);
  }
}

class Office extends Building {
  int numEmployees;

  Office(
      {required this.numEmployees,
        required super.address,
        required super.floors});

  @override
  void showDetails() {
    super.showDetails();
    print('Количество сотрудников: $numEmployees');
  }

  @override
  void startWorkDay() {
    print('Рабочий день начался');
  }

  @override
  double calculateMaintenanceCost() {
    return (numEmployees * 15) + (floors * 200);
  }
}

class Hospital extends Building {
  int numDoctors;
  int numPatients;

  Hospital(
      {required this.numDoctors,
        required this.numPatients,
        required super.address,
        required super.floors});

  @override
  void showDetails() {
    super.showDetails();
    print('Количество врачей: $numDoctors, пациентов: $numPatients');
  }

  @override
  void admitPatient() {
    print('Пациент был принят');
  }

  @override
  double calculateMaintenanceCost() {
    return (numPatients * 25) + (numDoctors * 30) + (floors * 150);
  }
}
