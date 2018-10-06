# -*- coding: utf-8 -*-
# serialwaitagentprocessor made by odenn --

import serial
import time

class WaitAgent():

    def my_status_set(self):
        w_file = open('test',mode='w')
        w_file.write("1")
        w_file.close()
    def status_check(self):
        for i in range(count):
            r_file = open('test')
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
            else:
                print("]Else process.")
                time.sleep(3)
    def status_fin(self):
        print("status_fin")
        w_file = open('test')
        w_file.write("0")
        w_file.close()

