FROM python:3.8.0-alpine3.10

RUN pip install --upgrade pip
RUN pip install mkdocs mkdocs-windmill pygments markdown-fenced-code-tabs markdown-include pymdown-extensions
RUN mkdir /code

WORKDIR /code

COPY . .

RUN mkdocs build