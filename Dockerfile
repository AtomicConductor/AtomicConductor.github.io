FROM python:3.8.0-alpine3.10

RUN pip install --upgrade pip
RUN pip install mkdocs \
                mkdocs-windmill \
                pygments\
                markdown-fenced-code-tabs \
                markdown-include \
                pymdown-extensions \
                markdown-captions
RUN pip3 install --upgrade --user awscli
RUN mkdir /code

WORKDIR /code

COPY . .

ENV PATH /root/.local/bin:$PATH
RUN rm -rf site
RUN mkdocs build --clean