
# Спроси меня

## О проекте
Любой может задать вопрос, любому зарегистрированному пользователю и получить на него ответ.

## Хештеги
В программе реализован функционал хештегов. Для добавления хештега перед нужным словом нужно добавить ```#```, после чего сохранить или редактировать вопрос/ответ. По хештегам можно отследить заданные вопросы, через главную страницу.

## ReCaptcha
При регистрации, или создания вопроса анонимным пользователям необходимо пройти проверку reCaptcha.

## Запуск приложения
Для запуска приложения необходимо иметь ```ruby '3.0.0'``` или установить [install ruby](https://www.ruby-lang.org/ru/documentation/installation/), далее из консоли вызвать команду ```bundle exec``` для установки гемов. Создать базу данных, и "прогнать" миграции командой ```rake db:migrate```. Запуск сервера ```rails s```.

[ссылка на heroku](https://mymegaask.herokuapp.com/)
