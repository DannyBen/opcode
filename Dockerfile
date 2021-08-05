FROM alpine

RUN apk --no-cache add bash git curl zsh

ENV PS1 "\n\n>> opcode \W \$ "

WORKDIR /app

COPY . .
COPY op /usr/local/bin/op

RUN git config --global pull.rebase false && \
    git config --global user.email "tester@dannyben.com" && \
    git config --global user.name "Approval Tester"

RUN chmod +x /usr/local/bin/op
