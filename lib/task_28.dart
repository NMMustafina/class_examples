/* Задача 28: Рекурсивное вычисление факториала числа
Описание:

Напиши функцию, которая рекурсивно вычисляет факториал произвольного неотрицательного целого числа n. Функция должна принимать число n в качестве аргумента и возвращать его факториал.

Требования:

Функция должна корректно обрабатывать базовый случай, когда n = 0, и возвращать факториал для этого случая.
Для остальных значений n функция должна вызывать сама себя с аргументом n-1 до тех пор, пока не достигнет базового случая.
Если передано отрицательное число, функция должна корректно обрабатывать этот случай, например, возвращать null или выводить сообщение об ошибке.
Пример:

Для входного значения n = 5 функция должна вычислить: 5!=5×4×3×2×1=120
Для входного значения n = 0 результат должен быть: 0!=1 */

void main() {
  try {
    print(calcFactorial(5));
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}

num calcFactorial(int n) {
  if (n < 0) {
    throw Exception('Число не может быть отрицательным');
  } else if (n == 0) {
    return 1;
  } else {
    return n * calcFactorial(n - 1);
  }
}
