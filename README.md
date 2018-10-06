# serialwaitagent
You can use Arduino serial communication when multi serial communication.  

このプログラムはArduinoとRaspberryPiとのシリアル通信を複数のプログラムから実行の際の衝突回避プログラムです。  

ユーザの必要に応じて自由にカスタムしたコードを生成することができます。  

設定パラメータ一覧  
　　・生成プログラム自身のステータスナンバー（このナンバーは重複しないでください）  
　　・ステータスファイルを置くファイルパス  
　　・通信中と判定後の処理待ち時間  
　　・判定のトライ回数  
  
プログラム生成方法  

```
ruby waitmaker.rb  
```

ステータスナンバー解説  
　　・0:処理待ち必要なし
　　・MYSTATUS:自身のステータスナンバ
　　・Else process:他プログラムが通信中
  
現在のバージョンのwaitmakerではステータスに応じた処理の自動生成は行いません、sample.pyを参考に自分で設定する必要があります。
  
Iovesophy.  
