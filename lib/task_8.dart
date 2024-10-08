/*
Задача 8: Создание класса "BankAccount"
Описание задачи:

Создай класс BankAccount, который будет представлять банковский счет.
В классе должны быть следующие поля:
accountNumber (строка) — номер счета.
balance (число с плавающей точкой) — баланс счета.
Добавь конструктор, который принимает номер счета и начальный баланс для инициализации полей.
Создай метод для пополнения счета (deposit), который принимает сумму пополнения и увеличивает баланс на эту сумму.
Добавь метод для снятия денег со счета (withdraw), который принимает сумму для снятия. Если на счете недостаточно средств, метод должен выводить сообщение об ошибке и не изменять баланс.
Создай метод для вывода информации о состоянии счета в формате: "Номер счета: <accountNumber>, Баланс: <balance>".
Добавь возможность проверки баланса через отдельный метод checkBalance.
Цель: Закрепить работу с классами, которые управляют состоянием объекта, а также добавить обработку условий и ограничений (например, недостаток средств на счете). Задача на основе работы с числами и условиями. */

void main() {
  BankAccount bankAccount =
      BankAccount(accountNumber: 'd5a2u1ds', balance: 200);

  bankAccount.accountInfo();
  bankAccount.deposit(100);
  bankAccount.withdraw(300);
  bankAccount.checkBalance();
}

class BankAccount {
  String accountNumber;
  double balance;

  BankAccount({required this.accountNumber, required this.balance});

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
    } else {
      print("Ошибка. Недостаточно средств на балансе");
    }
  }

  void accountInfo() {
    print("Номер счета: $accountNumber, Баланс: $balance");
  }

  void checkBalance() {
    print("Баланс: $balance");
  }
}
