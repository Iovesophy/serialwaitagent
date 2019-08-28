# coding: utf-8
system("touch hinagata.py")
puts "serialwaitagentMaker. このプログラムはあなたのステータス設定ファイルを自動生成できます. happy coding!! by odenn."
puts "数字は全て半角数字で入力してください。"
puts "設定スタート:"
puts "このプログラム自身のステータスナンバーを入力してください、ただし、他のプログラムステータスナンバーと同じナンバーは使わないでください。."
MYSTATUS = gets.to_s.gsub(/(\r\n|\r|\n|\f)/,"")

puts "ステータスファイルを置くファイルパスをフルパスで入力してください。"
PATH = gets.to_s.gsub(/(\r\n|\r|\n|\f)/,"")

puts "設定したい処理待ち時間を入力してください。"
WAIT = gets.to_s.gsub(/(\r\n|\r|\n|\f)/,"")

puts "設定したい処理待ちトライ回数を入力してください。"
TRY = gets.to_s.gsub(/(\r\n|\r|\n|\f)/,"")

#区分け処理、細かい判定を行う際使用、（AgentMakerでは未実装）
puts "実行ステータスを区分けしますか?y,n:" 
SEP = gets.to_s.gsub(/(\r\n|\r|\n|\f)/,"")
if SEP == "y"
    puts "いくつ区分けしますか?"
    COUNT = gets.to_s.gsub(/(\r\n|\r|\n|\f)/,"")
end

File.open("hinagata.py","w") do |code|

	code.puts "# -*- coding: utf-8 -*-"
	code.puts "# serialwaitagentprocessor made by odenn --"
	code.puts ""
	code.puts "import serial"
	code.puts "import time"
	code.puts ""
	code.puts "class WaitAgent():"
	code.puts ""
	code.puts "    def my_status_set(self):"
	code.puts "        w_file = open('#{PATH}',mode='w')"
	code.puts "        w_file.write(\"#{MYSTATUS}\")"
	code.puts "        w_file.close()"
	code.puts "    def status_check(self):"
	code.puts "        for i in range(count):"
	code.puts "            r_file = open('#{PATH}')"
	code.puts "            r_status = r_file.read()"
	code.puts "            status = int(r_status)"
	code.puts "            if status == #{MYSTATUS}:"
	code.puts "                print(\"]My process.\")"
	code.puts "                return True"
	code.puts "            elif status == 0:"
	code.puts "                print(\"]No process.\")"
	code.puts "                return True"
if SEP == "y"
    COUNT.to_i.times do |i|
        if i+1 ==  MYSTATUS.to_i
            puts "my status, pass."
        else
            code.puts "            elif status == #{i+1}:"
            code.puts "                print(\"]#{i+1}: process.\")"
            code.puts "                time.sleep(#{WAIT})"
        end
    end
end  
	code.puts "            else:"
	code.puts "                print(\"]Else process.\")"
	code.puts "                time.sleep(#{WAIT})"
	code.puts "    def status_fin(self):"
	code.puts "        print(\"status_fin\")"
	code.puts "        w_file = open('#{PATH}')"
	code.puts "        w_file.write(\"0\")"
	code.puts "        w_file.close()"
	code.puts ""
end
puts "+++++++++++コード生成:"
system("cat hinagata.py")
puts "コード生成完了しました。コピーしてお使いください。"
