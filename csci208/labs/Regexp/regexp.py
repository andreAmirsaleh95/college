#Danny Toback and Andre Amirsaleh

import re 

def prOne():
    f = open("SocialJusticeMinor.html",'r',encoding='utf-8')
    p = re.compile('([A-Z]{4}(/?))+ [1-3][0-9]{2}')
    s = f.readlines()
    for line in s:
        for t in p.finditer(line):
            print(t.group())
            f.close()
#prOne()

def prTwo():
    f = open("ContactBucknell.html",'r',encoding='utf-8')
    p = re.compile('[0-9]{3}.[0-9]{3}.[0-9]{4}')
    s = f.readlines()
    for line in s:
        for t in p.finditer(line):
            print(t.group())
            f.close()
#prTwo()

def prThree():
    f = open("ContactBucknell.html",'r',encoding='utf-8')
    p = re.compile('[a-z.]+@[a-z.]+')
    s = f.readlines()
    for line in s:
        for t in p.finditer(line):
            print(t.group())
            f.close()
#prThree()

def prFour():
    f = open("ContactBucknell.html",'r',encoding='utf-8')
    p = re.compile('([a-z]+)[.]([a-z]+)(@[a-z.]+)')
    s = f.readlines()
    f1 = open("ContactBucknell2.html", 'w', encoding='utf-8')
    for line in s:
        f1.write(p.sub(r'\2.\1\3', line))
    f.close()
    f1.close()
prFour()

def main():
    while(True):
        choice = int(input("Which Problem are you testing? Enter -1 to exit.\n"))
        if choice == 1:
            prOne()
        elif choice == 2:
            prTwo()
        elif choice == 3:
            prThree()
        elif choice == 4:
            prFour()
            print("File has been updated\n")
        elif choice == -1:
            break
        else:
            print("Please Enter a Number Between 1 and 4\n")

main()
