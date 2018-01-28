# grpc-web-proxy

Proxy to use grpc-web-client.
Please use only for testing.

## Example

Your gRPC server needs to be running with localhost:8081.
If you want to change it, use --entrypoint.

```
. dotenv && docker run --rm --env-file .env -v $(pwd):$(pwd) -w $(pwd) -p $GRPCWEBPROXY_PORT:$GRPCWEBPROXY_PORT -p $GRPCWEBPROXY_TLS_PORT:$GRPCWEBPROXY_TLS_PORT sagadash/grpc-web-proxy
```

## Refs

* https://github.com/improbable-eng/grpc-web
* https://github.com/improbable-eng/grpc-web/tree/master/go/grpcwebproxy
  * Options are in each file.