#!/usr/bin/python3

# This is a simple Caesar cypher encryption
# script that you can use to evade pre-runtime
# detection.

def caesarCypher():
    while True:
        string = input("enter a string: ")
        if string == 'q':
            break

        else:
            print(string, "-> ", end="")

            for char in string:
                print(chr(ord(char)+1), end="")
                
            print("\n")

if __name__ == "__main__":

    print("Send 'q' or CTRL + C to kill the process\n")

    caesarCypher()
