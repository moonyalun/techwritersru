# Этап 1: Соберите HTML документацию
FROM python:3.8 as builder

# Переменная окружения PYTHONUNBUFFERED, чтобы вывод был немедленно показан в консоли
ENV PYTHONUNBUFFERED=1

# Установка системных зависимостей (graphviz и Java Runtime Environment)
RUN apt-get update && apt-get install -y graphviz default-jre

WORKDIR /app
COPY . /app

# Копируем plantuml.jar в контейнер
COPY plantuml.jar /app/plantuml.jar

# Установите зависимости из файла requirements.txt и перенаправьте вывод в stdout (параметр 2>&1)
RUN pip install --no-cache-dir -r requirements.txt -v 2>&1

# Соберите HTML документацию и перенаправьте вывод в stdout (параметр 2>&1)
RUN make html 2>&1

RUN ls /app/build/html