# serialwaitagent  
Serial communication agent program.  

このプログラムはシリアル通信可能なコンピュータ(Raspberry PiとArduino UNOで検証済み)へ通信を複数のプログラムから実行時、衝突回避を行うプログラムです。  
python3系で動きます。  

ユーザの必要に応じて自由にカスタムしたコードを生成することができます。  
***
## 設定パラメータ一覧  
* 生成プログラム自身のステータスナンバー（このナンバーは重複しないでください）  
* ステータスファイルを置くファイルパス  
* 通信中と判定後の処理待ち時間  
* 判定のトライ回数  
***
## プログラム生成方法  

```
ruby waitmaker.rb  
```
***
## ステータスナンバー解説  
* 0:処理待ち必要なし  
* MYSTATUS:自身のステータスナンバー  
* Else process:他プログラムが通信中  
***
また、それぞれのステータスごとに処理をしたい場合は、区分けを行うを選択してください。  
また、区分けしたい数を入力すれば、その数だけ区分け処理コードが生成されます、選択しなければ生成されません。  
手動で行いたい場合はsample.pyを参考にしてください。  
  
odenn.  
