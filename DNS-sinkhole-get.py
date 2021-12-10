import requests
import os

url = input("Enter url for dns sinkhole list: ")
filename = url.split('/')
filename = filename[len(filename)-1]


content = requests.get(url)

with open("temp.dnssinkhole.file", "w") as of:
    of.write(str(content.text))


with open( filename + ".txt", "w") as ff, open("temp.dnssinkhole.file", "r") as sf:
    for line in sf:
        #print(line)
        newline = "0.0.0.0  " + line
        ff.write(newline)


os.remove("temp.dnssinkhole.file")