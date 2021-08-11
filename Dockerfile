#teste
FROM golang:alpine as build

WORKDIR /usr/local/go/src

COPY . . 

RUN go build -o /usr/local/go/src code_education_rocks.go

FROM scratch 

WORKDIR /usr/local/go/src/

COPY --from=build /usr/local/go/src/code_education_rocks /usr/local/go/src/code_education_rocks

CMD ["./code_education_rocks"]
