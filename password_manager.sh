#!/bin/bash

echo "パスワードマネージャーへようこそ！"

# サービス名を$serviceに代入
echo "サービス名を入力してください："
read service

# ユーザー名を$userに代入
echo "ユーザー名を入力してください："
read user

# パスワードを$passwordに代入
echo "パスワードを入力してください："
read password

# 入力された情報をpassword_manager.txtに保存
echo $service:$user:$password >>password_manager.txt

echo "Thank you!"
