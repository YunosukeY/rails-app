# サンプルアプリケーション
このアプリはRailsチュートリアルに機能を追加したものです。  
現在のRailsチュートリアルとの差分は

- [Terraformによるインフラのコード化](https://github.com/YunosukeY/terraform-rails-app)
- Dockerコンテナ化（RailsアプリとDBは別コンテナ）
- CircleCIによるCI

です。今後の追加機能としては

- Ansibleによる構成管理
- EKSでの運用
- Railsアプリへの機能追加

を考えています

## ローカルでの運用

1. ビルド
```Shell
$ ./entrypoints.sh build
```

2. テスト
```Shell
$ ./entrypoints.sh test
```

3. 実行  
  次を実行してからlocalhost:3000にアクセス  
```Shell
$ ./entrypoints.sh up
```

4. 終了
```Shell
$ ./entrypoints.sh down
```

## EC2上での運用
1. [Terraformによるインフラのコード化](https://github.com/YunosukeY/terraform-rails-app)に沿ってインフラを構築し、EC2に接続します。
2. EC2にDocker及びDocker Composeをインストールする  
  参考：  
    - [Get Docker Engine - Community for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
    - [Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)
    - [Install Docker Compose](https://docs.docker.com/compose/install/)
3. EC2にレポジトリをクローンし、[ローカルでの運用](#ローカルでの運用)の手順をEC2上で行う
4. http://(EC2のIP):3000にアクセスし、確認
