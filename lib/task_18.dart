/* Задача 18: Создание класса "Школа" с массивом объектов "Ученик"
Описание задачи:

Создай класс School, который будет представлять школу.
В классе School должно быть поле:
students — массив объектов класса Student (учеников), который будет хранить информацию обо всех учениках школы.
Создай класс Student, который будет представлять ученика.
Поля:
name (строка) — имя ученика.
age (целое число) — возраст ученика.
grade (строка) — класс, в котором учится ученик (например, "5A").
В классе School должны быть следующие методы:
Метод для добавления учеников:
addStudent(Student student) — метод для добавления объекта ученика в массив students.
Метод для вывода информации о всех учениках:
showAllStudents() — метод, который выводит информацию о каждом ученике в формате: "Имя: <name>, Возраст: <age>, Класс: <grade>".
Метод для поиска ученика по имени:
findStudentByName(String name) — метод, который ищет ученика по имени в массиве и выводит его информацию.
Дополнительно можно добавить:
Метод для удаления ученика:
removeStudent(String name) — метод для удаления ученика из списка по имени. */

void main() {
  School school = School();
  Student alex = Student(name: 'Алекс', age: 16, grade: '10 A');
  Student marti = Student(name: 'Марти', age: 16, grade: '10 B');
  Student martiTwo = Student(name: 'Марти', age: 15, grade: '9 C');

  school.addStudent(alex);
  school.addStudent(marti);
  school.addStudent(martiTwo);
  school.findStudentByName('Алекс');
  school.removeStudent('Марти');
  school.showAllStudents();
}

class School {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void showAllStudents() {
    print('В школе учатся:');
    for (var student in students) {
      print(
          'Имя: ${student.name}, Возраст: ${student.age}, Класс: ${student.grade}');
    }
  }

  void findStudentByName(String name) {
    for (var student in students) {
      if (student.name == name) {
        print(
            'Вы искали: ${student.name}, Возраст: ${student.age}, Класс: ${student.grade}');
      }
    }
  }

  void removeStudent(String name) {
    Student? studentToRemove;

    for (var student in students) {
      if (student.name == name) {
        studentToRemove = student;
      }
    }
    students.remove(studentToRemove);
    print('Вы исключили: ${studentToRemove?.name}');
  }
}

class Student {
  String name;
  int age;
  String grade;

  Student({required this.name, required this.age, required this.grade});
}
