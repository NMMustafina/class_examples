/* Задача 5: Создание класса "Student"
Описание задачи:

Создай класс Student, который будет представлять студента.
В классе должны быть следующие поля:
name (строка) — имя студента.
age (целое число) — возраст студента.
grades (список чисел) — список оценок студента.
Добавь конструктор, который принимает имя и возраст, а список оценок может быть пустым при создании.
Создай метод для добавления новой оценки в список.
Создай метод для расчета среднего балла (среднее арифметическое всех оценок).
Добавь метод, который выводит информацию о студенте в формате: "Имя: <name>, Возраст: <age>, Средний балл: <средний балл>".
Дополнительно можно добавить метод для вывода всех оценок студента.
Цель: Закрепить работу с коллекциями (списками) в классе, научиться добавлять элементы в список и реализовывать методы для вычисления информации на основе данных внутри класса. */

void main() {
  Student alex = Student(name: 'Alex', age: 20, grades: []);
  alex.addGrade([5, 4, 3]);
  alex.gradeInfo();
  alex.studentInfo();
}

class Student {
  String name;
  int age;
  List<int>? grades;

  Student({required this.name, required this.age, this.grades});

  addGrade(newGrade) {
    grades?.addAll(newGrade);
  }

  studentInfo() {
    var average = calcAverage();
    print("Имя: $name, Возраст: $age, Средний балл: $average");
  }

  gradeInfo() {
    print('Оценки: $grades');
  }

  calcAverage() {
    var sum = 0;

    for (var grade in grades!) {
      sum = sum + grade;
    }
    return (sum / grades!.length).round();
  }
}
