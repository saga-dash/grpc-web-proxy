FROM golang:alpine
RUN apk add --no-cache git \
  && rm -rf /var/lib/apt/lists/*

RUN go get -u github.com/improbable-eng/grpc-web/go/grpcwebproxy \
  && rm -rf /go/src /usr/local/go/src /usr/local/go/test /usr/local/go/doc /usr/local/go/pkg

# openssl req -x509 -nodes -new -keyout localhost.key -out localhost.crt -days 36500
COPY localhost.crt .
COPY localhost.key .

EXPOSE 8080

ENTRYPOINT [ "/go/bin/grpcwebproxy" ]
CMD [ "--server_tls_cert_file=localhost.crt", "--server_tls_key_file=localhost.key", "--backend_tls_noverify", "--backend_addr=docker.for.mac.localhost:8081" ]
