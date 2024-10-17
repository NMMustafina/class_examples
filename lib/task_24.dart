/* Задача 24: Наследование и полиморфизм — классы "Документ", "Книга", "Статья"
Описание задачи:

Создай базовый класс Document (Документ):

Этот класс будет представлять общий тип для всех документов.
Поля класса:
title (строка) — заголовок документа.
author (строка) — автор документа.
Методы класса:
showDetails() — виртуальный метод для отображения информации о документе. Этот метод будет переопределяться в дочерних классах.
Создай подклассы Book (Книга) и Article (Статья), которые будут наследовать от класса Document:

Класс Book:
Поля:
publisher (строка) — издатель книги.
pages (целое число) — количество страниц.
Переопредели метод showDetails() для отображения детализированной информации о книге (заголовок, автор, издатель, количество страниц).
Класс Article:
Поля:
journal (строка) — название журнала.
issue (строка) — выпуск, в котором опубликована статья.
Переопредели метод showDetails() для отображения детализированной информации о статье (заголовок, автор, журнал, выпуск).
Полиморфизм:

Создай список объектов типа Document, который будет включать как книги, так и статьи.
Вызови метод showDetails() для каждого объекта в списке, и каждый объект должен выводить свои уникальные детали, несмотря на то, что все они хранятся в одном списке как объекты базового класса Document.
Пример полиморфизма:

Когда метод showDetails() вызывается для объекта Book, отображается информация о книге.
Когда метод showDetails() вызывается для объекта Article, отображается информация о статье. */

main() {
  Book dune = Book(
      publisher: 'АСТ', pages: 704, title: 'Дюна', author: 'Фрэнк Герберт');
  Book solaris = Book(
      publisher: 'Эксмо',
      pages: 598,
      title: 'Солярис',
      author: 'Станислав Лем');
  Article fantastic = Article(
      journal: 'Старт в науке',
      issue: '2024-10',
      title: 'Фантастика и реальность',
      author: 'Кирилл Булычёв');
  Article technology = Article(
      journal: 'Научное обозрение',
      issue: '2021-03',
      title: 'Технологии, предсказанные в фантастике',
      author: 'Николай Твердынин');

  List<Document> documentsList = [];
  documentsList.addAll([dune, solaris, fantastic, technology]);

  for (var doc in documentsList) {
    doc.showDetails();
  }
}

class Document {
  String title;
  String author;

  Document({required this.title, required this.author});

  showDetails() {
    print('Заголовок документа: $title, автор документа: $author');
  }
}

class Book extends Document {
  String publisher;
  int pages;

  Book(
      {required this.publisher,
        required this.pages,
        required super.title,
        required super.author});

  @override
  showDetails() {
    super.showDetails();
    print('Издатель книги: $publisher, количество страниц: $pages');
  }
}

class Article extends Document {
  String journal;
  String issue;

  Article(
      {required this.journal,
        required this.issue,
        required super.title,
        required super.author});

  @override
  showDetails() {
    super.showDetails();
    print(
        'Название журнала: $journal, выпуск, в котором опубликована статья: $issue');
  }
}
