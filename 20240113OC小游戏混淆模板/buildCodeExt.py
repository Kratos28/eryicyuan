#coding=utf-8
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
from string import lowercase
from sys import maxint
from time import ctime
import uuid
from datetime import datetime
from buildCode import *
import buildCode.alg
import buildCode.fixCode

try:
    	input = raw_input
except NameError:
    	pass

def main(srcdir, outdir):
    createTempCode(outdir)


def mainfixCode(srcdir, outdir, count=30):
#    count = random.randint(1,5)
    fixCode.AddCode(srcdir, outdir, count)

def mainfixCode_H(srcdir, outdir, count=30):
    fixCode.AddCode_H(srcdir, outdir, count)

def mainOptCode(srcdir, outdir):
    alg.getHeadFuncNameTest()

def createTempCode(outdir):

    classCount = random.randint(18, 30)
    ClassList = {}
    for i in range(1, classCount):
        className = buildCode.getFuncInfo(outdir)
        ClassList[className] = className

    ImportClassName = "AA"+core.getrandomstr(random.randint(4, 10)) + "import"
    buildCode.setImportHead(outdir, ImportClassName, ClassList)
    buildCode.setImportMethod(outdir, ImportClassName, ClassList)

def newTemplate(headFile, methodFile):
    # print headFile, methodFile, file_utils.getCurFileDir()
    Temphead = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + headFile
    Tempmethod = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + methodFile
    readheadfile = open(Temphead, 'r')
    readmethodfile = open(Tempmethod, 'r')
    print (readheadfile.read(), readmethodfile.read())
    readheadfile.close()
    readmethodfile.close()


