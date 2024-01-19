#coding=utf-8
import os
import sys
import json
from struct import pack, unpack, unpack_from
from struct import error as struct_error
import file_utils
import core
import re
import random
import string
import sys
import core
import file_utils
import os
import os.path
import time
from copy import deepcopy
from random import randint, choice
#from string import lowercase
#from sys import maxint
from time import ctime
import uuid
from datetime import datetime
import buildCode


def AddCode(srcdir, outdir, count):
    print(srcdir, outdir)
    file_utils.copy_files(file_utils.getWorkFullPath(srcdir),
                          file_utils.getWorkFullPath(outdir))
    addFiles = []
    addMMFiles=[]
    fullDir = file_utils.getWorkFullPath(outdir)
    if not os.path.exists(fullDir):
        print (u'Folder is noexit')

    igoreFiles = ['.git', 'build', "testProj.xcodeproj"]
    igoreFileFullPaths = []

    for ifile in igoreFiles:
        fullpath = os.path.join(fullDir, ifile)
        igoreFileFullPaths.append(fullpath)

    addFiles = file_utils.list_filesforext(
        fullDir, addFiles, igoreFileFullPaths, ".m")
    addMMFiles = file_utils.list_filesforext(
        fullDir, addMMFiles, igoreFileFullPaths, ".mm")

    if len(addFiles) > 0:
        AddLajiCode(addFiles, count)

    if len(addMMFiles) > 0:
        AddLajiCode(addMMFiles, count)

def AddLajiCode(addFiles, count):
    for file in addFiles:
        Content = core.loadFiles(file)
        content_add = ""

#        count = random.randint(5,30)
        count = 100
        funcCount = random.randint(int(count), int(count)+100)
        for i in range(1, funcCount):

            alghead, algFunc = buildCode.returnAlgFunc(
                buildCode.modelAlgfunc())
            header1 = alghead[0]
            header2 = alghead[1]
            if header2.find('buildBinarySearch111') >= 0:
                pass
            else:
                content_add = content_add + "\n" + algFunc

        Content = Content+ content_add

        core.writeFile(file, Content)
        #print file

def AddCode_H(srcdir, outdir, count):
    print(srcdir, outdir)
    file_utils.copy_files(file_utils.getWorkFullPath(srcdir),
                          file_utils.getWorkFullPath(outdir))
    addMMFiles=[]
    fullDir = file_utils.getWorkFullPath(outdir)
    if not os.path.exists(fullDir):
        print (u'Folder is noexit')

    igoreFiles = ['.git', 'build', "testProj.xcodeproj",".DS_Store"]
    igoreFileFullPaths = []

    for ifile in igoreFiles:
        fullpath = os.path.join(fullDir, ifile)
        igoreFileFullPaths.append(fullpath)

    add_HFiles = file_utils.list_filesforext(
        fullDir, addMMFiles, igoreFileFullPaths, ".h")

    if len(add_HFiles) > 0:
        HAddLajiCode_H(add_HFiles, count)

def HAddLajiCode_H(addFiles, count):
    for file in addFiles:

        KeyEnd = "@end"
        Content = core.loadFiles(file)
        content_add = ""
        funcCount = random.randint(5, 25)
        for i in range(2, funcCount):
            alghead, algFunc = buildCode.returnAlgFunc_H(buildCode.modelAlgfunc())
            content_add = algFunc + "\n" + KeyEnd
            Content = buildCode.strreplace(KeyEnd, content_add, Content)
        core.writeFile(file, Content)

def getContent_addHeaderC(Content,header1):
    if header1.find("[]") >= 0:
        pass
    else:
        newHeader1 = header1 + "\n" + "@implementation"
        Content = re.sub("@implementation", newHeader1, Content)
    return Content

def getContent_addMethod(Content,header1):

    if header1.find("[]") >= 0:
        pass
    else:
        if random.randint(1,2) == 1:

            m = r'int [a-zA-z]+'
            n = str(random.randint(5, 1000))
            header1 = re.sub(m, n, header1)
            header1 = re.sub("void ", "\t", header1)
            newH = "];" + header1
            temp1 = random.randint(1,3)
            if temp1 == 1:
                newH = "];\n\t" + "@\"{}\"".format(buildCode.GetClassFuncName()) + ";\n"
            elif temp1 == 2:
                pass
                # newH = "];\n\t" + "NSString *{0}{1} = @\"{0}\"".format(buildCode.GetClassFuncName(),random.randint(1,100)) + ";\n"
            else:
                pass
            Content = re.sub("];", newH, Content)
        else:
            pass

    return Content

def getContent_addMethod2(Content,header1):

    if header1.find("[]") >= 0:
        pass
    else:
        newH = "];" + header1
        Content = re.sub("];", newH, Content)
    return Content
