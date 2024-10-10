/* Задача: Использование исключений — класс "Банк" с выбросом исключения при недостаточном балансе
Описание задачи:

Создай класс BankAccount, который будет представлять банковский счет.

Поля класса:
accountNumber (строка) — номер счета.
balance (число с плавающей точкой) — баланс счета.
Методы класса BankAccount:

Метод deposit(double amount):
Позволяет пополнять счет на определенную сумму.
Если сумма пополнения меньше или равна нулю, выбрасывай исключение с сообщением об ошибке.
Метод withdraw(double amount):
Позволяет снять деньги со счета.
Если запрашиваемая сумма превышает доступный баланс, метод должен выбросить исключение (например, InsufficientFundsException), указывая, что на счете недостаточно средств.
Метод checkBalance():
Возвращает текущий баланс счета.
Создай собственное исключение InsufficientFundsException:

Это пользовательское исключение будет выбрасываться, если при попытке снятия средств баланс счета оказывается недостаточным.
Исключение должно содержать сообщение об ошибке, которое будет объяснять причину выброса исключения.
Обработка исключений:

При вызове методов класса BankAccount (например, при попытке снять больше денег, чем доступно на счете) нужно перехватывать выброшенные исключения и обрабатывать их с выводом понятного сообщения. */

void main() {
  BankAccount bankAccount =
  BankAccount(accountNumber: 'd5a2u1ds', balance: 200);

  try {
    bankAccount.deposit(-100);
  } catch (e) {
    print(e);
  }

  try {
    bankAccount.withdraw(500);
  } catch (e) {
    print(e);
  }

  bankAccount.checkBalance();
}

class BankAccount {
  String accountNumber;
  double balance;

  BankAccount({required this.accountNumber, required this.balance});

  void deposit(double amount) {
    if (amount <= 0) {
      throw InvalidDepositException('Сумма пополнения должна быть больше нуля');
    }
    balance += amount;
  }

  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
    } else {
      throw InsufficientFundsException(
          'Недостаточно средств на балансе для снятия $amount');
    }
  }

  void checkBalance() {
    print("Баланс: $balance");
  }
}

class InsufficientFundsException implements Exception {
  final String message;

  InsufficientFundsException(this.message);

  @override
  String toString() => 'Ошибка: $message';
}

class InvalidDepositException implements Exception {
  final String message;

  InvalidDepositException(this.message);

  @override
  String toString() => 'Ошибка: $message';
}
