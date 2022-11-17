# 使い方

```

```

# ビルド

## Nimコマンドを使ってビルドする場合

```
$ nimble install -y cligen
$ nim c jsonfmt.nim
```

## Ubuntuでdocker build

```
docker run -v $(pwd):/root -v $(pwd)/build:/opt --rm nimlang/nim:1.6.8-ubuntu /bin/bash -c 'cd /root; nimble install -y cligen; nim c jsonfmt.nim; mv jsonfmt /opt';
```
