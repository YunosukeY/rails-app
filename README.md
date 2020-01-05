# サンプルアプリケーション
このアプリはRailsチュートリアルに機能を追加したものです  
Railsチュートリアルとの差分は以下のとおりです

- [Terraform, Ansibleによるインフラのコード化](https://github.com/YunosukeY/infra-for-rails-app)
- Dockerコンテナ化（RailsアプリとDBは別コンテナ）
- CircleCIによるCI/CDパイプライン
- [AWS EKSでの運用(TerraformによるIaC)](https://github.com/YunosukeY/eks-for-rails-app)

## 利用方法
現在http://18.177.98.239:3000でサービスを公開しています  

## ローカルでの運用

1. ビルド
    ```
    $ ./entrypoints.sh build
    
    ...
    
    Successfully tagged rails-app:latest
    ```

2. テスト
    ```
    $ ./entrypoints.sh test
    
    ...
    
    Running via Spring preloader in process 22
    Started with run options --seed 39623
    
      68/68: [==========================================================] 100% Time: 00:00:09, Time: 00:00:09
    
    Finished in 9.00811s
    68 tests, 324 assertions, 0 failures, 0 errors, 0 skips
    Stopping rails-app_db_1 ... done
    Removing rails-app_db_1 ... done
    Removing network rails-app_default
    ```

3. 実行  
    次を実行してからlocalhost:3000にアクセス  
    ```
    $ ./entrypoints.sh up
    Creating network "rails-app_default" with the default driver
    Creating rails-app_db_1 ... done
    Creating rails-app_web_1 ... done
    ```

4. 終了
    ```
    $ ./entrypoints.sh down
    Stopping rails-app_web_1 ... done
    Stopping rails-app_db_1  ... done
    Removing rails-app_web_1 ... done
    Removing rails-app_db_1  ... done
    Removing network rails-app_default
    ```

## AWS EC2上での運用
1. [Terraform, Ansibleによるインフラのコード化](https://github.com/YunosukeY/infra-for-rails-app)に沿ってインフラを構築し、EC2に接続します。
2. EC2にレポジトリをクローンし、[ローカルでの運用](#ローカルでの運用)の手順をEC2上で行います
3. http://(EC2のIP):3000にアクセスし、確認します

## AWS EKS上での運用
[EKSでの運用](https://github.com/YunosukeY/eks-for-rails-app)をご覧ください
