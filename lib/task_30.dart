void main() {
  ConcreteSubject weatherStation = ConcreteSubject();
  ConcreteObserver alex = ConcreteObserver('Алекс');
  ConcreteObserver marti = ConcreteObserver('Марти');

  weatherStation.registerObserver(alex);
  weatherStation.registerObserver(marti);
  weatherStation.notifyObservers('Сегодня солнечный день!');
  weatherStation.removeObserver(marti);
  weatherStation.notifyObservers('Ожидается сильный дождь.');
}

abstract class Observer {
  void update(String message);
}

abstract class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers(String message);
}

class ConcreteSubject extends Subject {
  List<Observer> observers = [];
  //ConcreteSubject(this.observers);

  @override
  void registerObserver(Observer observer) {
    observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    observers.remove(observer);
  }

  @override
  void notifyObservers(String message) {
    for (var observer in observers) {
      observer.update(message);
    }
  }
}

class ConcreteObserver extends Observer {
  String name;

  ConcreteObserver(this.name);

  @override
  void update(String message) {
    print('$name получил сообщение: $message');
  }
}
