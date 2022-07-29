from doctest import FAIL_FAST
import socket
import threading
#import signal
#import sys

#def signal_handler(sig, frame):
    #print('\nDone!')
    #sys.exit(0)

#signal.signal(signal.SIGINT, signal_handler)
#print('Press Ctrl+C to exit...')

DISCONNECT_MESSAGE = "DISCONNECT"
##

def handle_client_connection(client_socket, address):
   print('Accepted connection from {}:{}'.format(address[0], address[1]))
   try:
      connect = True
      while connect:
         request = client_socket.recv(1024)
         #print("Mensagem recebida (encode):", request)
         if request:
            #print("Mensagem recebida (encode):", request)
            msg = request.decode('utf-8')
            #print("Mensagem recebida (decode):", msg)
            #print("disconnect_message:",DISCONNECT_MESSAGE)
            if msg == DISCONNECT_MESSAGE:
               connect = False
               #break #Tb funciona
            #print("Connect:", connect)
            print('{} from {}:{}'.format(msg, address[0], address[1]))
            #msg = msg.encode('utf-8')
            #client_socket.send(msg)
            msg_send = str("Message received").encode('utf-8')
            client_socket.send(msg_send)
      client_socket.close()
   except (socket.timeout, socket.error):
      print('Client {} error. Done!'.format(address))


ip_addr = "0.0.0.0"
tcp_port = 5005

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((ip_addr, tcp_port))
server.listen(5)  # max backlog of connections

print('Listening on {}:{}'.format(ip_addr, tcp_port))

print("[STARTING] server is starting...")
while True:
    client_sock, address = server.accept()
    client_handler = threading.Thread(
        target=handle_client_connection, args=(client_sock, address), daemon=True)
    client_handler.start()
