#!/bin/bash
## Create Auth Cookie
## 認証情報をcookie.txtに出力する
curl -c cookie.txt localhost:28080/Controller.php -d "act=mg_login" -d "login_id=admin" -d "login_pass=passpass"

## Post Template Data
function deploy_web_basic_template () {
    ## cookie.txtを読み込んで、テンプレートをPOSTでアップロードする
    curl -b cookie.txt localhost:28080/Controller.php -F "act=mg_w_design_edit_exec" -F "id=$1" -F "part=<$2"
}

function deploy_web_widget_template () {
    curl -b cookie.txt localhost:28080/Controller.php -F "act=mg_w_design_widget_edit_exec" -F "id=$1" -F "widget_id=$1" -F "part=<$2"
}

deploy_web_basic_template(1000, )

