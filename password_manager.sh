#!/bin/bash

echo パスワードマネージャーへようこそ！

# 作業を選択、$taskに代入
read -p '次の選択肢から入力してください(Add Password/Get Password/Exit):' task

# 以下条件分岐
# while文('Exit'が入力されるまで)

while [ "$task" != 'Exit' ]; do
    # 入力
    if [ "$task" = "Add Password" ]; then

        # サービス名を$serviceに代入
        read -p 'サービス名を入力してください:' service

        # ユーザー名を$userに代入
        read -p 'ユーザー名を入力してください:' user

        # パスワードを$passwordに代入
        read -p 'パスワードを入力してください:' password

        # 入力された情報をpassword_manager.txtに保存
        echo $service:$user:$password >>password_manager.txt

        echo パスワードの追加は成功しました。
        read -p '次の選択肢から入力してください(Add Password/Get Password/Exit):' task
    # 出力
    elif [ "$task" = "Get Password" ]; then
        read -p 'サービス名を入力してください' search

        if cat password_manager.txt | cut -d : -f 1 | grep -x $search >/dev/null; then
            service=$(cat password_manager.txt | grep ^$search | cut -d : -f 1)
            echo "サービス名:$service"
            user=$(cat password_manager.txt | grep ^$search | cut -d : -f 2)
            echo "ユーザー名:$user"
            password=$(cat password_manager.txt | grep ^$search | cut -d : -f 3)
            echo "パスワード:$password"
        else
            echo そのサービスは登録されていません。
        fi
        read -p '次の選択肢から入力してください(Add Password/Get Password/Exit):' task

    else
        echo 入力が間違えています。Add Password/Get Password/Exit から入力してください。
        read -p '次の選択肢から入力してください(Add Password/Get Password/Exit):' task
    fi

done
echo Thank you!
