/* Задача 27: Реализация классов "Очередь" и "Стек" с использованием дженериков
Описание задачи:

Создай класс Queue (Очередь):

Очередь — это структура данных, работающая по принципу FIFO (First In, First Out), где первый добавленный элемент будет первым удалён.
Используй дженерики, чтобы класс мог работать с любыми типами данных (например, int, String, double и т.д.).
Поля класса:
List<T> — список элементов, где T — это дженерик для указания типа данных.
Методы класса:
enqueue(T element) — добавляет элемент в конец очереди.
dequeue() — удаляет и возвращает первый элемент очереди.
peek() — возвращает первый элемент очереди, не удаляя его.
isEmpty() — проверяет, пуста ли очередь.
size() — возвращает количество элементов в очереди.
Создай класс Stack (Стек):

Стек — это структура данных, работающая по принципу LIFO (Last In, First Out), где последний добавленный элемент будет первым удалён.
Также используй дженерики, чтобы стек мог хранить данные любого типа.
Поля класса:
List<T> — список элементов, где T — это дженерик для указания типа данных.
Методы класса:
push(T element) — добавляет элемент на вершину стека.
pop() — удаляет и возвращает элемент с вершины стека.
peek() — возвращает элемент с вершины стека, не удаляя его.
isEmpty() — проверяет, пуст ли стек.
size() — возвращает количество элементов в стеке.
Объяснение работы дженериков:

Дженерики позволяют создать универсальные классы, которые могут работать с разными типами данных. Вместо того, чтобы создавать отдельные классы для работы с типами int, String и т.д., ты создаешь один универсальный класс с параметром типа T, который заменяется на конкретный тип при создании объекта.
Используй параметр T в объявлениях методов и полей класса, чтобы обозначить работу с дженериками.
Поведение классов:

Очередь:
Элементы добавляются в конец очереди с помощью метода enqueue(), а удаляются с начала очереди с помощью метода dequeue().
Очередь следует принципу "первый пришел — первый ушел".
Стек:
Элементы добавляются на вершину стека с помощью метода push(), а удаляются с вершины стека с помощью метода pop().
Стек следует принципу "последний пришел — первый ушел".
Примеры методов для обоих классов:

Методы будут реализованы так, чтобы можно было добавлять элементы в очередь или стек, удалять их, просматривать первый или последний элемент, а также проверять количество элементов.
Пример использования дженериков:

Оба класса будут поддерживать работу с любыми типами данных, такими как int, String, double и т.д.
Ты сможешь создать объекты этих классов для работы с различными типами данных:
Например, Queue<int> для работы с очередью целых чисел.
Или Stack<String> для работы со стеком строк.
Пример сценария использования:

Создай очередь для работы с целыми числами и добавь несколько элементов, затем удаляй их по порядку.
Создай стек для работы с строками, добавь несколько строк, затем удаляй их с вершины. */

void main() {
  Queue<int> intQueue = Queue<int>([0, 5, 10, 15]);
  Queue<String> stringQueue = Queue<String>(['а', 'б', 'в']);

  intQueue.enqueue(20);
  intQueue.dequeue();
  intQueue.peek();
  intQueue.isEmpty();
  intQueue.size();

  stringQueue.enqueue('г');
  stringQueue.dequeue();
  stringQueue.peek();
  stringQueue.isEmpty();
  stringQueue.size();

  Stack<int> intStack = Stack<int>([0, 5, 10, 15]);
  Stack<String> stringStack = Stack<String>(['а', 'б', 'в']);

  intStack.push(20);
  intStack.pop();
  intStack.peek();
  intStack.isEmpty();
  intStack.size();

  stringStack.push('г');
  stringStack.pop();
  stringStack.peek();
  stringStack.isEmpty();
  stringStack.size();
}

class Queue<T> {
  List<T> queueList = [];

  Queue(this.queueList);

  void enqueue(T element) {
    queueList.add(element);
    print('Добавлен элемент $element в конец очереди: $queueList');
  }

  void dequeue() {
    queueList.removeAt(0);
    print('Удален первый элемент очереди: $queueList');
  }

  void peek() {
    print('Первый элемент очереди: ${queueList[0]}');
  }

  void isEmpty() {
    print('Пуста ли очередь: ${queueList.isEmpty}');
  }

  void size() {
    print('Количество элементов в очереди: ${queueList.length}');
  }
}

class Stack<T> {
  List<T> stackList = [];

  Stack(this.stackList);

  void push(T element) {
    stackList.add(element);
    print('Добавлен элемент $element на вершину стека: $stackList');
  }

  void pop() {
    stackList.removeAt(stackList.length - 1);
    print('Удален элемент с вершины стека: $stackList');
  }

  void peek() {
    print('Элемент на вершине стека: ${stackList[stackList.length - 1]}');
  }

  void isEmpty() {
    print('Пуст ли стек: ${stackList.isEmpty}');
  }

  void size() {
    print('Количество элементов в стеке: ${stackList.length}');
  }
}
