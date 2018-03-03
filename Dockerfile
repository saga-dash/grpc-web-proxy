FROM golang:alpine
RUN apk add --no-cache git \
  && rm -rf /var/lib/apt/lists/*

RUN go get -u github.com/saga-dash/grpc-web/go/grpcwebproxy \
  && rm -rf /go/src /usr/local/go/src /usr/local/go/test /usr/local/go/doc /usr/local/go/pkg

ENTRYPOINT [ "/bin/sh", "-c", "exec /go/bin/grpcwebproxy --server_tls_cert_file=$GRPCWEBPROXY_CERTIFICATE_KEY --server_tls_key_file=$GRPCWEBPROXY_PRIVATE_KEY --backend_tls=$GRPCWEBPROXY_RUN_TLS --backend_tls_noverify --backend_addr=$GRPC_HOST:$GRPC_PORT --server_bind_address=$GRPCWEBPROXY_BIND --server_http_debug_port=$GRPCWEBPROXY_PORT --server_http_tls_port=$GRPCWEBPROXY_TLS_PORT --run_http_server=$GRPCWEBPROXY_RUN_HTTP --run_tls_server=$GRPCWEBPROXY_RUN_TLS" ]
