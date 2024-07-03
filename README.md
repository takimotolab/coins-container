# COINS Dev Container

## Outline

COINSを利用するためのDockerコンテナ。

## Windows

1. WSL2をインストール[参考](https://learn.microsoft.com/ja-jp/windows/wsl/install)
2. WSL2上でDockerをインストール[参考](https://qiita.com/nujust/items/d7cd395baa0c5dc94fc5)
3. 適当なフォルダに本リポジトリをクローン
4. WSL2上で本リポジトリのdocker-compose.ymlがあるフォルダに移動
5. WSL2上で`docker compose up -d`を実行
6. WSL2上で`docker ps`でコンテナIDを確認
7. WSL2上で`docker exec -it <コンテナID> bash`を実行

## Linux/macOS

1. Dockerをインストール
2. 適当なフォルダに本リポジトリをクローン
3. 本リポジトリのdocker-compose.ymlがあるフォルダに移動
4. `docker compose up -d`を実行
5. `docker ps`でコンテナIDを確認
6. `docker exec -it <コンテナID> bash`を実行
