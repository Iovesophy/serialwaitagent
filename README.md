# serialwaitagent  
Serial communication agent program.  

このプログラムはシリアル通信可能なコンピュータ(Raspberry PiとArduino UNOで検証済み)へ通信を複数のプログラムから実行時、衝突回避を行うプログラムです。  
python3系で実行可能です。  

ユーザの必要に応じて自由にカスタムしたコードを生成することができます。  
***
## 設定パラメータ一覧  
* 生成プログラム自身のステータスナンバー（このナンバーは重複しないでください）  
* ステータスファイルを置くファイルパス  
* 通信中と判定後の処理待ち時間  
* 判定のトライ回数  
***
## プログラム生成方法  
あらかじめRubyをインストールする必要があります。  
```
ruby waitmaker.rb  
```
上記コマンドを実行し、アナウンスに従って設定してください。  
***
## ステータスナンバー解説  
* 0:処理待ち必要なし  
* MYSTATUS:自身のステータスナンバー  
* Else process:他プログラムが通信中  
***
また、それぞれのステータスごとに処理をしたい場合は、区分けを行うを選択してください。  
また、区分けしたい数を入力すれば、その数だけ区分け処理コードが生成されます、選択しなければ生成されません。  
手動で行いたい場合はsample.pyを参考にしてください。  
***
## 実行環境  
実行環境は,*nix環境を想定しています。windowsではお使いになれません。  

* macOS High Sierra 10.13.6
* Ubuntu14.04LTS
* RASPBIAN Version:June 2018 Release date:2018-06-27 Kernel version:4.14  
で動作確認しました。

生成後のプログラムは自身の環境に合わせてお使いください。
  
## 生成例  

パラメータ設定例  
***
このプログラム自身のステータスナンバーを入力してください、ただし、他のプログラムステータスナンバーと同じナンバーは使わないでください。  
1  
ステータスファイルを置くファイルパスをフルパスで入力してください。  
/home/user/test/status.st  
設定したい処理待ち時間を入力してください。  
3  
設定したい処理待ちトライ回数を入力してください。  
6  
実行ステータスを区分けしますか?(特別な理由が無ければ、区分けは必要ありません)y,n:  
y  
いくつ区分けしますか?  
8  
***
### 上記パラメータによって生成されたコード  
```python3
# -*- coding: utf-8 -*-
# serialwaitagentprocessor made by odenn --

import serial
import time

class WaitAgent():

    def my_status_set(self):
        w_file = open('/home/user/test/status.st',mode='w')
        w_file.write("1")
        w_file.close()
    def status_check(self):
        for i in range(count):
            r_file = open('/home/user/test/status.st')
            r_status = r_file.read()
            status = int(r_status)
            if status == 1:
                print("]My process.")
                return True
            elif status == 0:
                print("]No process.")
                return True
            elif status == 2:
                print("]2: process.")
                time.sleep(3)
            elif status == 3:
                print("]3: process.")
                time.sleep(3)
            elif status == 4:
                print("]4: process.")
                time.sleep(3)
            elif status == 5:
                print("]5: process.")
                time.sleep(3)
            elif status == 6:
                print("]6: process.")
                time.sleep(3)
            elif status == 7:
                print("]7: process.")
                time.sleep(3)
            elif status == 8:
                print("]8: process.")
                time.sleep(3)
            else:
                print("]Else process.")
                time.sleep(3)
    def status_fin(self):
        print("status_fin")
        w_file = open('/home/user/test/status.st')
        w_file.write("0")
        w_file.close()
```
odenn.  
