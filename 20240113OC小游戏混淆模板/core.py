#!/usr/bin/env python
# coding=utf-8
import sys
import file_utils
import re
import log_utils
import os
import os.path
import time
import random
import string
import stat
import shutil
import buildCode

test_text = "\{//testopen"

def replacesrc():
    print("----")

def loadArray(path, records):
#"""加载文件
    try:
         file = open(path, "r")
    except IOError as message:
        print("read file error({0}:{1})".format(message, path))  
        sys.exit(1)
    lines = file.readlines()
    for line in lines:
        records.append(line)
    file.close()
    return records

def saveArray(path, records):
    try:
        file = open(path, "w")
    except IOError as message:
        print("write file error({0}:{1})".format(message, path))
        sys.exit(1)
    file.writelines(records)
    file.close()

def loadFiles(path):
    file_object = open(path)
    try:
        all_the_text = file_object.read()
    except IOError as message:
        print("write file error({0}:{1})".format(message, path))
        sys.exit(1)
    finally:
        file_object.close()
    return all_the_text

def writeFile(path, all_the_text):
    file_object = open(path, "w")
    try:
        file_object.write(all_the_text)
    except IOError as message:
        print("write file error({0}:{1})".format(message, path))
        sys.exit(1)
    finally:
        file_object.close( )


def getrandomstr(num=8):
    ran_str = ''.join(random.sample(
        string.ascii_letters + string.ascii_uppercase, num))
#    ranKey = "abcdefgihjklmnopqrstuvwxyz"
#    ranKey2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#    return buildCode.getCihui2() + random.choice(ranKey2) + random.choice(ranKey2) + random.choice(ranKey)  # + ran_str

    ranKey = "abcdefgihjklmnopqrstuvwxyz"
    ranKey2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgihjklmnopqrstuvwxyz"
    key = "123"
    if random.choice(key) == "1":
        return random.choice(ranKey) +  buildCode.getCihui2() + random.choice(ranKey)
    elif random.choice(key) == "2":
        return random.choice(ranKey2) +  buildCode.getCihui2()
    else :
        return random.choice(ranKey2) + random.choice(ranKey) +  buildCode.getCihui2()

def getrandomstr51(num=8):
    ran_str = ''.join(random.sample(
        string.ascii_letters + string.ascii_uppercase, num))
    ranKey = "abcdefgihjklmnopqrstuvwxyz"
# ranKey2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    key2 = buildCode.getCihui2() + random.choice(ranKey)
    return key2.lower() # + random.choice(ranKey)

def getrandomstr_alg_parm(num=8):
    ran_str = ''.join(random.sample(string.ascii_letters + string.ascii_uppercase, num))
    ranKey = "abcdefgihjklmnopqrstuvwxyz"
    ranKey2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgihjklmnopqrstuvwxyz"
    key = "123"
    if random.choice(key) == "1":
        return buildCode.getCihui2() + buildCode.getCihui2() + random.choice(ranKey)
    elif random.choice(key) == "2":
        return random.choice(ranKey2) +  buildCode.getCihui2()+buildCode.getCihui2()
    else :
        key2 = buildCode.getCihui2() + random.choice(ranKey)
        return key2.lower() # + random.choice(ranKey)
    # ranKey2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#    key2 = buildCode.getCihui2() + random.choice(ranKey)
#    return key2.lower() # + random.choice(ranKey)


def getrandomstrup(num=8):
    ran_str = ''.join(random.sample(
        string.ascii_letters + string.ascii_uppercase, num))
    ranKey = "abcdefgihjklmnopqrstuvwxyz"
    ranKey2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return buildCode.getCihui2() + random.choice(ranKey2) + random.choice(ranKey2) + random.choice(ranKey2)  # + ran_str


def getrandomstr2(num=8):
    ran_str = ''.join(random.sample(
        string.ascii_letters + string.ascii_uppercase, num))
    ranKey = "abcdefgihjklmnopqrstuvwxyz"
    ranKey2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return random.choice(ranKey2) + random.choice(ranKey2) + random.choice(ranKey2) + random.choice(ranKey2)  # + ran_str

def getrandonNum(num=32):
    #y=list(range(1,10))
    #ran_str = ''.join(random.sample(['5','1','2','3','4','5','6','7','8','9','10','15','23'], num))
    #ran_str = ''.join(random.sample(['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'], 5))
    ran_str = ''.join(random.sample(string.digits+string.digits+string.digits+string.digits+string.digits + string.digits, num))
    return ran_str

def findSubstring(string,substring,times):
    current = 0
    for i in range(1,times+1):
        current = string.find(substring,current)+1
        if current == 0 :  return -1
    return current-1

def compfunc(text, funcPos):
    beginFun = text.rfind("\n", 0, funcPos)

    # print(beginFun, funcPos)
    # print(text[beginFun:funcPos])
    getFunType = text.rfind("+", beginFun, funcPos)
    getFunType2 = text.rfind("-", beginFun, funcPos)
    
    if getFunType!=-1 :
        checkFunc = text.rfind("\n", getFunType,funcPos)
        if checkFunc!=-1:
            return False
        else:
            #print(checkFunc)
            return True
    elif getFunType2 != -1:
        checkFunc2 = text.rfind("\n", getFunType2, funcPos)
        if checkFunc2!=-1:
            return False
        else:
            #print(checkFunc2)
            return True
    else: 
        return False

def findStr(string, subStr, findCnt):  
    listStr = string.split(subStr,findCnt)  
    #print listStr  
    if len(listStr) <= findCnt:    #分割完后的字符串的长度（分割段）与要求出现的次数比较  
        return -1  
    return len(string)-len(listStr[-1])-len(subStr) 

def delfile(filepath):
    if os.path.exists(filepath):
        os.remove(filepath)

def delete_file(filePath):
    if os.path.exists(filePath):
        for fileList in os.walk(filePath):
            for name in fileList[2]:
                os.chmod(os.path.join(fileList[0], name), stat.S_IWRITE)
                os.remove(os.path.join(fileList[0], name))
        shutil.rmtree(filePath)
        return "delete ok"
    else:
        return "no filepath"

def comRegex(path, funcs, FuncFiles, FuncIncludeFiles):

    text = loadFiles(path)
    y=list(range(1,len(FuncFiles)))
    isInclude = False
    #插入代码片段
    for func in funcs:
        ##可能存在多个函数名需要循环查找
        #
        timeCut = text.count(func)
        nCount = 0
        while ( nCount <= timeCut):
            #找到函数位置
            startTx = findSubstring(text,func,nCount)
            nCount =  nCount+1
            if startTx != -1:
                if compfunc(text, startTx):
                    #print(startTx, func)
                    strtPos2 =  text.find("{", startTx+len(func))
                    #插入到函数后面 
                    if strtPos2!= -1:
                        strtPos2 = strtPos2 +1
                        slice = random.sample(y, 1)
                        text = text[:strtPos2] + "\n" +FuncFiles[slice[0]] + text[strtPos2:]
                        isInclude = True
    
    #插入代码头文件           
    strIncludePos2 = text.find("@implementation")
    if strIncludePos2 != -1 and isInclude:
        text = text[:strIncludePos2] + "\n" + FuncIncludeFiles[slice[0]] +"\n"+ text[strIncludePos2:]

    writeFile(path, text)
