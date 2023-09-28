# cardano-submit-api

## Build Image
```
docker build -t cardano-submit-api https://github.com/solidsnakedev/cardano-submit-api.git
```

## Run Container
```
docker run --name cardano-submit-api -v ./node/ipc/:/node/ipc/ -d -p 8090:8090 -p 8080:8080 cardano-submit-api 
```