#coding=utf-8
import re
import random
import argparse
import sys
import os
import os.path
import hashlib
import string
import time
import hashlib
import file_utils
import shutil
from biplist import *
import plistlib

def getCurFileDir():
    path = sys.path[0]
    if os.path.isdir(path):
        return path
    elif os.path.isfile(path):
        return os.path.dirname(path)

cihuilist = []
def cihui():
    global cihuilist
    if len(cihuilist) == 0:
        TempTxt = getCurFileDir() + '/wordsList.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        cihuilist = strCont.split('\n')

def getCihui():
    global cihuilist
    cihui()
    num1 = random.randint(0, len(cihuilist)-1)
    return cihuilist[num1]

def cur_file_dir():
    path = sys.path[0]
    if os.path.isdir(path):
        return path
    elif os.path.isfile(path):
        return os.path.dirname(path)

def encrypargfile(filepath, passwd):
    curDir = cur_file_dir()
    xorfile = curDir + "/YHJM"
    cmdline = xorfile + " " + filepath + " " + passwd
    os.system(cmdline)

def getCiZu():
    key2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgihjklmnopqrstuvwxyz"
    randomKey = random.randint(1, 6)
    ran1 = random.choice(key2)
    newPath1 = ""
    i = random.randint(1,10)
    if randomKey == 1:
        newPath1 = str(getCihui()) + ran1 + format(str(i), '0>1s')
    elif randomKey == 2:
        newPath1 = str(getCihui()) + ran1 + random.choice(key2)
    elif randomKey == 3:
        newPath1 = str(getCihui()) + ran1 + str(getCihui())
    elif randomKey == 4:
        newPath1 = str(getCihui()) + ran1 + str(getCihui()) + random.choice(key2) + str(getCihui())
    elif randomKey == 5:
        newPath1 = ran1.lower() + ran1.lower() + format(str(i), '0>2s')
    elif randomKey == 6:
        newPath1 = str(getCihui()) + str(getCihui()) + ran1 + str(getCihui())
    elif randomKey == 6:
        newPath1 = random.choice(key2) + random.choice(key2)
    else:
        newPath1 = ran1 + str(getCihui())
    return newPath1.lower()


def replacePlist22(dplist, plistpath, ourdir):
    try:
        (filepath, tempfilename) = os.path.split(plistpath)
        isExists = os.path.exists(ourdir)
        if not isExists:
            os.makedirs(ourdir)
        path = ourdir + "/" + tempfilename
        writePlist(dplist, ourdir, False)
    except (InvalidPlistException, NotBinaryPlistException) as e:
        print ("Not a plist:", e)

def replacePlist(dplist, plistpath, ourdir):
    try:
        (filepath, tempfilename) = os.path.split(plistpath)
        isExists = os.path.exists(ourdir)
        if not isExists:
            os.makedirs(ourdir)
        path = ourdir + "/" + tempfilename
        # writePlist(dplist, ourdir, False)
        with open(ourdir, "wb") as f:  # 打开一个二进制的.plist文件
            plistlib.dump(dplist, f)  # 将字典对象写入文件
    except (InvalidPlistException, NotBinaryPlistException) as e:
        print ("Not a plist:", e)

def createFolder(new_dir):
    dir = new_dir + "/" + getCihui()
    if not os.path.exists(dir):
        print (dir, '\n配置文件目录不存在，创建目录...')
        os.makedirs(dir)
    return dir

#改文件夹下的文件名,图片md5
def files_rename(key):
    
    path = sys.path[0] + "/inFolder"
    new_dir = sys.path[0] + "/OutFolder"

    if os.path.exists(new_dir):
        shutil.rmtree(new_dir)
        os.mkdir(new_dir)

    if not os.path.exists(new_dir):
        print (new_dir, '\n配置文件目录不存在，创建目录...')
        os.makedirs(new_dir)

    addFiles = []
    fullDir = path

    igoreFiles = ['.git', 'build']
    igoreFileFullPaths = []

    if not os.path.exists(new_dir):
        print (new_dir, '\n配置文件目录不存在，创建目录...')
        os.makedirs(new_dir)

    for ifile in igoreFiles:
        fullpath = os.path.join(fullDir, ifile)
        igoreFileFullPaths.append(fullpath)
    
    addFiles = file_utils.list_files(fullDir, addFiles, igoreFileFullPaths)
    
    newdict = {}
    for item in addFiles:
        old = os.path.join(os.path.abspath(path), item)
        new_path = os.path.join(os.path.abspath(new_dir), os.path.basename(item))
        fileEnd = os.path.splitext(item)[1]

        shutil.copyfile(old, new_path)


        encrypargfile(new_path, key)

    print ('加密完成')


#删除文件夹下内容
def del_file(path):
    ls = os.listdir(path)
    for i in ls:
        c_path = os.path.join(path, i)
        if os.path.isdir(c_path):
            del_file(c_path)
        else:
            os.remove(c_path)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(u"修改图片MD5！")
    parser.add_argument('-d', '--dir', help=u"所在文件夹路径", action="store", dest="dir", default="./")
    parser.add_argument('-num', '--num', help=u"输出文件数量",
                        action="store", dest="number", default="")
    parser.add_argument('-key', '--key', help=u"加密的key",
                        action="store", dest="key", default="")
    args = parser.parse_args()
    files_rename(args.key)
    print (u'运行完成！！')
