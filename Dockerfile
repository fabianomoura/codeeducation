FROM golang:stretch AS stage_build

COPY desafioGoLang.go /go/src

WORKDIR /go/src

RUN go mod init src && \
    go build desafioGoLang.go

FROM scratch

COPY --from=stage_build /go/src/desafioGoLang /

ENTRYPOINT [ "/desafioGoLang" ]