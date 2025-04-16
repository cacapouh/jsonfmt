# jsonfmt

深さを指定してjsonをフォーマットするコマンド

# ビルド

CLIのビルド:
```
nim c jsonfmt.nim
```

JavaScriptのビルド:
```
nim js -d:release jsonfmtjs.nim
```

# デモンストレーション

```
$ ./jsonfmt --depth 0 "$(cat ./test.json)"
{"min_position":8,"has_more_items":false,"items_html":"Bike","new_latent_count":1,"data":{"length":20,"text":"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."},"numericalArray":[23,32,20,31,30],"StringArray":["Carbon","Oxygen","Oxygen","Nitrogen"],"multipleTypesArray":true,"objArray":[{"class":"lower","age":5},{"class":"middle","age":7},{"class":"upper","age":5},{"class":"upper","age":8},{"class":"upper","age":4}]}

$ ./jsonfmt --depth 1 "$(cat ./test.json)"
{
  "min_position": 8,
  "has_more_items": false,
  "items_html": "Bike",
  "new_latent_count": 1,
  "data": {"length":20,"text":"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."},
  "numericalArray": [23,32,20,31,30],
  "StringArray": ["Carbon","Oxygen","Oxygen","Nitrogen"],
  "multipleTypesArray": true,
  "objArray": [{"class":"lower","age":5},{"class":"middle","age":7},{"class":"upper","age":5},{"class":"upper","age":8},{"class":"upper","age":4}]
}

$ ./jsonfmt --depth 2 "$(cat ./test.json)"
{
  "min_position": 8,
  "has_more_items": false,
  "items_html": "Bike",
  "new_latent_count": 1,
  "data": {
      "length": 20,
      "text": "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  "numericalArray": [
      23,
      32,
      20,
      31,
      30
  ],
  "StringArray": [
      "Carbon",
      "Oxygen",
      "Oxygen",
      "Nitrogen"
  ],
  "multipleTypesArray": true,
  "objArray": [
      {"class":"lower","age":5},
      {"class":"middle","age":7},
      {"class":"upper","age":5},
      {"class":"upper","age":8},
      {"class":"upper","age":4}
  ]
}

$ ./jsonfmt --depth 3 "$(cat ./test.json)"
{
  "min_position": 8,
  "has_more_items": false,
  "items_html": "Bike",
  "new_latent_count": 1,
  "data": {
      "length": 20,
      "text": "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  },
  "numericalArray": [
      23,
      32,
      20,
      31,
      30
  ],
  "StringArray": [
      "Carbon",
      "Oxygen",
      "Oxygen",
      "Nitrogen"
  ],
  "multipleTypesArray": true,
  "objArray": [
      {
            "class": "lower",
            "age": 5
      },
      {
            "class": "middle",
            "age": 7
      },
      {
            "class": "upper",
            "age": 5
      },
      {
            "class": "upper",
            "age": 8
      },
      {
            "class": "upper",
            "age": 4
      }
  ]
}
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

## Homebrewでインストール

```
$ brew tap cacapouh/jsonfmt
$ brew install cacapouh/jsonfmt/jsonfmt
```