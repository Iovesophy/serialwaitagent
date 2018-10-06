import serial
import time

class TransWait():

    def my_status_set(self):
        mystatus = 1
        w_file = open('~/.status.st',mode='w')
        w_file.write(mystatus)
        w_file.close()

    def status_check(self):
        mystatus = 1
        for i in range(10):
            r_file = open('~/.status.st')
            r_status = r_file.read()
            status = int(r_status)
            if status == mystatus:
                return True
            elif status == 0:
                return True
            elif status == 2:
                print("]status:2 ok waitting now 3 sec...")
                time.sleep(3)
            elif status == 3:
                print("]status:3 ok waitting now 3 sec...")
                time.sleep(3)
            elif status == 4:
                print("]status:4 ok waitting now 3 sec...")
                time.sleep(3)
            else:
                print("]status:unknown ok waitting now 1 sec...")
                time.sleep(1)
            time.sleep(1)
            r_file.close()
        print("timeout.")

    def status_fin(self):
        print("status_fin")
        w_file = open('~/.status.st',mode='w')
        w_file.write("0")
        w_file.close()

