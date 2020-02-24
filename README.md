PhotoPlace
====
Overview
----
  PhotoPlaceはGoogle MAPを利用し、撮影スポットを探しやすくした風景投稿サイトです。

DEMO
----
*管理者ログインの際は以下URLで管理者ログイン画面に移動できます。  
http://photoplace.work/admins/sign_in*
![README](https://user-images.githubusercontent.com/56124478/73640813-45f49000-46b2-11ea-8bc5-8ee7136c91e6.gif)
Features
----
このサイトの強みはMAPから投稿の風景を探すことができることです。
従来のサイトでは気に入った風景写真を見つけた際に、  

『この写真どこで撮ったんだろう？』  

という思いに答えられないことが多いですが、PhotoPlaceは写真に位置情報を持っているため
風景写真がどこで撮れるのかをすぐに知ることができるようになっています。

Technology used
----
*Gem*  
  gem 'devise'  
  gem 'paranoia'  
  gem 'kaminari'  
  gem "refile",require:"refile/rails",github:'refile/refile'  
  gem "refile-mini_magick"  
  gem 'bootstrap', '~> 4.3.1'  
  gem 'jquery-rails'  
  gem 'cocoon'  
  gem 'ransack'  
  gem "pry-byebug"  
  gem 'gmaps4rails'  
  gem 'geocoder'  
  gem 'bxslider-rails'  
  gem 'font-awesome-rails'  
  gem 'rubocop'  

*API*  
  Maps JavaScript API  
  Geocoding API  



Requirement
----
ruby 2.5.7  
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'  


Functions list
----
利用者  
       会員登録:&emsp;名前・電話番号・メールアドレス・パスワードを記入し、会員登録を行うことができます。  
       ログイン機能:&emsp;ユーザログイン画面からメールアドレスとパスワードでログインできます。  
       会員ページ:&emsp;ユーザ情報の編集・ユーザーの情報（プロフィール）を編集できます。  
       いいね一覧:&emsp;いいねに登録した商品を一覧表示します。  
       退会機能:&emsp;退会手続きを行えるようにします。  
       写真の投稿:&emsp;風景写真の投稿が行えます。  
       投稿の検索・一覧:&emsp;投稿された情報を一覧表示します。投稿タイトル・タグ・位置情報で検索が行えます。  
       投稿のマップ表示:&emsp;投稿情報をマップ形式に表示いたします。  
       投稿の詳細:&emsp;投稿情報の詳細・いいね・コメントを表示します。  
       いいね機能:&emsp;投稿に対していいね（お気に入り）登録ができる。  
       ランキング表示:&emsp;いいねの多い順にランキング形式に表示します。  
       コメント機能:&emsp;投稿に対してコメントができる。  

管理者機能  
	    ログイン機能:&emsp;管理者登録したユーザでのメール/パスワードによるログインです。  
	    会員情報閲覧:&emsp;会員情報の一覧表示が行えます。  
	    会員情報編集・削除:&emsp;会員情報の編集、削除が行えます。  
	    会員いいね一覧表示:&emsp;その会員がある商品にしたいいねを一覧で表示します。  
	    投稿情報検索/一覧:&emsp;投稿された情報を一覧表示します。投稿タイトル・タグ・位置情報で検索が行えます。  
            投稿情報編集・削除:&emsp;投稿された情報の編集・削除を行えます。  
	    タグの検索・一覧表示:&emsp;投稿情報につけられるタグを一覧で表示し、検索できる。  
            タグの生成:&emsp;タグの編集・削除が行えます。  

Install
----
$ git clone https://github.com/yuudaihasegawa/PhotoPlace- （GitHub上からアプリをダウンロードしてください。）  
$ bundle install  (gemをinstall)
$ rails db:migrate  (dbを作成)
