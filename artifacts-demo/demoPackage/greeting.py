import datetime
import socket

def greeting():
    current_date = datetime.datetime.now().strftime("%Y-%m-%d")
    hostname = socket.gethostname()
    return(f"Hi, today is {current_date}, I'm running on {hostname}")
