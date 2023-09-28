# cardano-submit-api

NODE_IPC_PATH=../
```
docker build -t cardano-submit-api https://github.com/solidsnakedev/cardano-submit-api.git
```

```
docker run -v ./node/ipc:/node/ipc -d -p 8090:8090 -p 8080:8080 cardano-submit-api
```