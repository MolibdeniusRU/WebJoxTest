# WebJoxTest

## Порядок запуска проекта:

1. Для запуска проекта небходимо установить [Docker](https://www.docker.com/)
2. Склонировать локально репозиторий

````console
git clone git@github.com:MolibdeniusRU/WebJoxTest.git
````

3. Перенести содиржимое `${PWD}/WebJoxTest/db/images/` в `${PWD}/WebJoxTest/app/public/uploads/images/`
4. Открыть терминал по адрессу `${PWD}/WebJoxTest/app`
5. Запустить в терминале команду:

````console 
docker-compose up -d
````