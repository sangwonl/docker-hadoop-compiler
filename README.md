### Build dockerized hadoop compiler
```
$ docker build -t hadoop-compiler .
```

### Build the specific version of hadoop
```
$ docker run -v $(PWD)/output:/root/output hadoop-compiler 2.7.2
```

### Built hadoop file
```
$ ls ./output
hadoop-2.7.2.tar.gz
```
