#coding=utf-8
import re
import random
import sys
import core
import file_utils
import os
import os.path
import time
from copy import deepcopy
from random import randint, choice
from string import lowercase
from sys import maxint
from time import ctime
import uuid
import shutil
from biplist import *
from datetime import datetime
import core
import buildCodeExt
import buildCode

try:
    	input = raw_input
except NameError:
    	pass

#注释
def mainComments(plistOurDir,srcdir, outdir):
#        print(plistOurDir, srcdir, outdir)
        if os.path.exists(outdir):
            shutil.rmtree(outdir)
        shutil.copytree(srcdir, outdir, symlinks=True, ignore=shutil.ignore_patterns('.git'))
                    #file_utils.copy_files(srcdir, outdir)
        addFiles = []
        fullDir = outdir
        if not os.path.exists(fullDir):
            print(u'Folder is noexit')

        igoreFiles = ['.git', 'build', "HSKConfuse.xcodeproj","WDLYDemo","WDLYDemo.xcodeproj",".png",".jpg",".js",".jpeg",".part",".mp3",".xml",".txt",".atlas",".php",".fnt",".ttf"]
        igoreFileFullPaths = []

        for ifile in igoreFiles:
            fullpath = os.path.join(fullDir, ifile)
            igoreFileFullPaths.append(fullpath)
                
        addFiles = file_utils.list_files(fullDir, addFiles, igoreFileFullPaths)

        if len(addFiles) <= 0:
            return
        #print(addFiles)
        deleteCommentCode1(plistOurDir, addFiles)

def deleteCommentCode1(fullDir, filelist):
    oldkey1 = "([^:/])//.*"
    oldkey2 = "^//.*"
    oldkey3 = "/\\*{1,2}[\\s\\S]*?\\*/"
    oldkey4 = "^\\s*\\n"
    newkey1 = "\\1"
    newkey = ""
    print u'删除注释！！！！！！！'
    for iFile in filelist:
        Content = core.loadFiles(iFile)
        Content = re.sub(oldkey1, newkey1, Content)
        Content = re.sub(oldkey2, newkey, Content)
        Content = re.sub(oldkey3, newkey, Content)
        Content = re.sub(oldkey4, newkey, Content)
        #保存到新文件
        core.writeFile(iFile, Content)
