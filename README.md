# Ruby開発者のためのHeroku入門
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sho7650/heroku_ruby_0124/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sho7650/heroku_ruby_0124/tree/main)

## セミナー概要

開発したアプリケーションを迅速に提供できるインフラは常に求められています。
クラウドによって仮想環境の調達は容易になりましたが、アプリケーションを動かすためのミドルウェアやデータベースの設計、導入には依然として時間がかかります。
Herokuでは、必要なミドルウェアは自動的に判断され、データベースはワンクリックで作成できるため、開発したアプリケーションをいますぐに公開することが可能です。

本Webセミナーでは、Ruby開発者の方々を対象に、Ruby on Rails やSinatra でのHerokuへのデプロイ方法を、デモを交えてご説明します。
アプリケーションをいますぐに公開する手順を知りたいRuby開発者の方は、ぜひご参加ください。

## 当Githubサイトのご案内

Webセミナー内で使用したサンプルプログラムを公開しています。

## 使い方

### 前提条件

1. ローカル環境で、Ruby 3.2.x 以上が稼働すること
2. `git` コマンドが利用可能なこと
2. Bundler が利用可能なこと
3. Rails が利用可能な環境であること
4. Heroku アカウントを有しており、かつ [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)が導入され、利用可能なこと
5. ローカルでの開発や試行には、PostgreSQLが稼働している必要がある場合があります

### 利用手順(CLIのケース)

1. 事前に Heroku login を済ませておくこと
2. `git clone https://github.com/tabesfdc/heroku_ruby_0124.git` を実行する
3. `cd heroku_ruby_0124` により、カレントディレクトリを変更する
4. `heroku login` にて、Heroku へログインを済ませる
5. `heroku create` により、Heroku へ新たにアプリのデプロイ環境を作成する
6. `heroku addons:create heroku-postgresql:hobby-dev` を実行し、Heroku Postgres を利用できるようにする
7. `git push heroku master` で、作成した Heroku へアプリケーションをデプロイ
8. `heroku open` でデプロイしたアプリケーションの稼働確認ができます
9. ログを確認する場合には `heroku logs` を利用ください

## もっとかんたんな使い方

### Heroku buttonを使おう

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)


# 注意事項

- Windowsの場合、諸々制限があり、実行できない可能性があります。
- そもそも Macでしか実行確認をしていません
