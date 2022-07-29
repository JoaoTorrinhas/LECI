import socket
import sys
import psutil
import time
import datetime #trabalho do nuno

DISCONNECT_MESSAGE = "DISCONNECT"

ip_addr = "192.168.1.65"  # 192.168.1.65 (Viseu) / 127.0.0.1 (RC-1) / 192.168.40.235 (UA) / 192.168.1.69 (Aveiro)
tcp_port = 5005

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.connect((ip_addr, tcp_port))

counter = 0
n_times = input("How many times do you want to send the information? ")
while True:
   try:
      verify_message = ""
		# TODO: send information about the cpu and memory to the server
      #message = ("CPU: " + str(psutil.cpu_percent()) + "%  Memory: " + str(psutil.virtual_memory()[2])+"%").encode('utf-8')
      message = str(datetime.datetime.now()).encode('utf-8')	#trabalho do nuno
		#print("y:", message)
      if len(message) > 0:
         sock.send(message)
         counter += 1
         #a = sock.recv(2048)
         #print(a)
         response = sock.recv(2048).decode('utf-8')  # 4096
         print('Server response: {}'.format(response))
      time.sleep(2)  # 2 sec para enviar a próxima mensagem
      #print("Counter:", counter)
      if counter == int(n_times):
         verify_message = input("Continue to send information or disconnect (y/n)? ")
         counter = 0
      if verify_message == "n":
         # TODO: should disconnect
         #counter = 0
         message = DISCONNECT_MESSAGE
         if len(message) > 0:
            sock.send(message.encode('utf-8'))
            response = sock.recv(4096).decode('utf-8')
            #print('Server response: received -> {}'.format(response))
            print("[DISCONNECT] disconecting from the server...")
         break
   except (socket.timeout, socket.error):
      print('Server error. Done!')
      sys.exit(0)
