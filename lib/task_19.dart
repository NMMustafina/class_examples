/* Задача 19: Композиция — класс "Computer"
Описание задачи:

Создай класс Computer, который будет представлять компьютер как сложную систему.
В классе Computer должны быть поля, представляющие основные компоненты компьютера:
Processor — класс, представляющий процессор компьютера.
Memory — класс, представляющий оперативную память (RAM).
Storage — класс, представляющий накопитель (SSD или HDD).
Каждый из этих компонентов должен быть отдельным классом с полями, описывающими его характеристики. Например:
Класс Processor:
Поля: brand (строка), frequency (число с плавающей точкой) — тактовая частота в ГГц, cores (целое число) — количество ядер.
Класс Memory:
Поля: size (целое число) — объем оперативной памяти в гигабайтах, type (строка) — тип памяти (например, DDR4).
Класс Storage:
Поля: type (строка) — тип накопителя (SSD или HDD), capacity (целое число) — объем в гигабайтах.
В классе Computer должны быть методы:
describe() — метод, который выводит информацию о всех компонентах компьютера: процессор, память и накопитель.
Дополнительно можно добавить метод upgradeMemory(), который позволяет увеличить объем оперативной памяти.
Используй композицию, чтобы включить объекты классов Processor, Memory, и Storage как поля класса Computer. */

void main() {
  Processor processor =
  Processor(brand: 'Intel Core i7', frequency: 3.6, cores: 8);
  Memory memory = Memory(size: 16, type: 'DDR4');
  Storage storage = Storage(type: 'SSD', capacity: 500);
  Computer computer =
  Computer(processor: processor, memory: memory, storage: storage);

  computer.describe();
  computer.upgradeMemory(32);
  computer.describe();
}

class Computer {
  Processor processor;
  Memory memory;
  Storage storage;

  Computer(
      {required this.processor, required this.memory, required this.storage});

  void describe() {
    print(
        'Компоненты компьютера:\nПроцессор: ${processor.brand}, тактовая частота: ${processor.frequency}, количество ядер: ${processor.cores}\nОперативная память: ${memory.type}, объем: ${memory.size} ГБ\nНакопитель: ${storage.type}, объем: ${storage.capacity} ГБ');
  }

  void upgradeMemory(int value) {
    if (value > 0) {
      memory.size = value;
    } else {
      print('Ошибка: объем памяти должен быть положительным');
    }
  }
}

class Processor {
  String brand;
  double frequency;
  int cores;

  Processor(
      {required this.brand, required this.frequency, required this.cores});
}

class Memory {
  int size;
  String type;

  Memory({required this.size, required this.type});
}

class Storage {
  String type;
  int capacity;

  Storage({required this.type, required this.capacity});
}
