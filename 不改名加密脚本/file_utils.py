#!/usr/bin/env python
# coding=utf-8
import os
import os.path
import glob
import re
import platform
import subprocess
import inspect
import sys
import codecs
import threading
import time
#import log_utils
import uuid
import hashlib
import time

curDir = os.getcwd()

def list_files(src, resFiles, igoreFiles):

    if os.path.exists(src):

        if os.path.isfile(src) and src not in igoreFiles:
            resFiles.append(src)
        elif os.path.isdir(src):
            for f in os.listdir(src):
                if src not in igoreFiles:
                    list_files(os.path.join(src, f), resFiles, igoreFiles)

    return resFiles


def list_filesforext(src, resFiles, igoreFiles, ext):
    addFiles = list_files(src, resFiles, igoreFiles)
    Filesext = []
    for i in addFiles:
        if os.path.splitext(i)[1] == ext:
           Filesext.append(i)
    return Filesext


def list_Folder(src, resFiles, igoreFiles):
    if os.path.exists(src):
        if os.path.isdir(src):
            if os.path.isdir(src) and src not in igoreFiles:
                resFiles.append(src)
                #print(src)
            for f in os.listdir(src):
                if src not in igoreFiles:
                    list_Folder(os.path.join(src, f), resFiles, igoreFiles)

    return resFiles


def list_files_ext(src, resFiles, igoreFiles, ext):
    f_list = os.listdir(src)
    for i in f_list:
        # os.path.splitext():分离文件名与扩展名
        if os.path.splitext(i)[1] == ext:
            resFiles.append(src+"/"+i)
    return resFiles

def del_file_folder(src):
    if os.path.exists(src):
        if os.path.isfile(src):
            try:
                src = src.replace('\\', '/')
                os.remove(src)
            except:
                pass

        elif os.path.isdir(src):
            for item in os.listdir(src):
                itemsrc = os.path.join(src, item)
                del_file_folder(itemsrc)

            try:
                os.rmdir(src)
            except:
                pass


def copy_files(src, dest):
    if not os.path.exists(src):
#        log_utils.warning("the src is not exists.path:%s", src)
        return

    if os.path.isfile(src):
        copy_file(src, dest)
        return

    for f in os.listdir(src):
        sourcefile = os.path.join(src, f)
        targetfile = os.path.join(dest, f)
        if os.path.isfile(sourcefile):
            copy_file(sourcefile, targetfile)
        else:
            copy_files(sourcefile, targetfile)                

def copy_file(src, dest):
    sourcefile = src#getFullPath(src)
    destfile = dest#getFullPath(dest)
    if not os.path.exists(sourcefile):
        return
    if not os.path.exists(destfile) or os.path.getsize(destfile) != os.path.getsize(sourcefile):
        destdir = os.path.dirname(destfile)
        if not os.path.exists(destdir):
            os.makedirs(destdir)
        destfilestream = open(destfile, 'wb')
        sourcefilestream = open(sourcefile, 'rb')
        destfilestream.write(sourcefilestream.read())
        destfilestream.close()
        sourcefilestream.close()

def getCurrDir():
    global curDir
    retPath = curDir
    if platform.system() == 'Darwin':
        retPath = sys.path[0]
        lstPath = os.path.split(retPath)
        if lstPath[1]:
            retPath = lstPath[0]
    return retPath

def getWorkDir():
    return os.getcwd()

def getCurFileDir():
   path = sys.path[0]
   if os.path.isdir(path):
        return path
   elif os.path.isfile(path):
        return os.path.dirname(path)

def getWorkFullPath(filename):
    if os.path.isabs(filename):
        return filename
    currdir = getWorkDir()
    filename = os.path.join(currdir, filename)
    filename = filename.replace('\\', '/')
    filename = re.sub('/+', '/', filename)
    return filename

def getFullPath(filename):
    if os.path.isabs(filename):
        return filename
    currdir = getCurrDir()
    filename = os.path.join(currdir, filename)
    filename = filename.replace('\\', '/')
    filename = re.sub('/+', '/', filename)
    return filename

def create_uuid():
    return str(uuid.uuid1())

def create_md5():
    m=hashlib.md5()
    m.update(bytes(str(time.time()),encoding='utf-8'))
    return m.hexdigest()

def changeImgfileName(path):
    #global i
    if not os.path.isdir(path) and not os.path.isfile(path):
        return False
    if os.path.isfile(path):
        file_path = os.path.split(path)  #分割出目录与文件
        lists = file_path[1].split(".")#分割出文件与文件扩展名  
        file_ext = lists[-1] #取出后缀名(列表切片操作)
        img_ext = ['bmp','jpeg','gif','psd','png','jpg']
        if file_ext in img_ext:
            os.rename(path, file_path[0]+"/"+lists[0]+"_"+str(uuid.uuid1())+"."+file_ext)
           #i += 1
    elif os.path.isdir(path):
        for x in os.listdir(path):
            changeImgfileName(os.path.join(path, x))     
