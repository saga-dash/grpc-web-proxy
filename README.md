# grpc-web-proxy

Proxy to use grpc-web-client.
Please use only for testing.

## Example

Your gRPC server needs to be running with localhost:8081.
If you want to change it, use --entrypoint.

```
docker run --rm -p 8080:8080 sagadash/grpc-web-proxy
```

## Refs

* https://github.com/improbable-eng/grpc-web
* https://github.com/improbable-eng/grpc-web/tree/master/go/grpcwebproxy
  * Options are in each file.