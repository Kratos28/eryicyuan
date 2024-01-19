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
# import alg
__all__ = ["alg", "fixCode", "filehash"]  # package1下有file1.py,file2.py
# from alg import *

def newTemplateHead(path, file):  # 获取模板生成的封装
   r = open(file_utils.curDir() + '/buildCodeCof/newTemplate/' + path, 'r')  # 打开模板文件
   d = r.read() #读模板文件的数据
   r.close() #关闭模板文件
   w = open(file_utils.curDir() + '/' + controller +
            '/' + controller + file, 'w')  # 创建目标文件
   w.write(d.replace('<#Unit#>', controller).replace('<#unit#>', controller.lower()).replace('<#Root#>', root).replace('<#ViewOperation#>', presenter_h).replace('<#ViewOperation_m#>', presenter_m).replace('<#ModelInterface#>', model).replace('<#ViewModelInterface#>', view_model_h).replace('<#ViewModelImplementation#>', view_model_m)) #进行写入文件
   w.close() #关闭文件

def newTemplate(headFile, methodFile):
    # TemplateClass_h.txt
    # TemplateClass_m.txt
    #print (headFile, methodFile, file_utils.getCurFileDir()))
    Temphead = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + headFile
    Tempmethod = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + methodFile
    readheadfile = open(Temphead, 'r')
    readmethodfile = open(Tempmethod, 'r')
    #print readmethodfile.read()
    readheadfile.close()
    readmethodfile.close()


def buildDict():
    numfloder = random.randint(3, 8)
    contentValue = ""
    for i in range(1, numfloder):
        key1 = core.getrandomstr(random.randint(8, 18))
        value1 = core.getrandomstr(random.randint(8, 18))
        cont1 = "@\"" + key1 + "\":@\"" + value1 + "\",\n"
        contentValue = contentValue + cont1

    ContentDictName = core.getrandomstr()
    returnContent = "return " + ContentDictName + ";"
    Content = "NSDictionary *" + ContentDictName + \
        " = @{ " + contentValue + "};" + "\n" + returnContent + "\n"
    ContentValues = "@{" + contentValue + "}"
    return ContentDictName, ContentValues, Content,

def buildArray():
    # 	NSArray * arr1 = @[
	# 	@"MmGGkKxsqMFySx",
	# 	@"OYTsctlOhZTlco",
	# ]
    numfloder = random.randint(3, 8)
    contentValue = ""
    for i in range(1, numfloder):
        key1 = core.getrandomstr(random.randint(8, 18))
        cont1 = "@\"" + key1 + "\",\n"
        contentValue = contentValue + cont1

    ContentArrayName = core.getrandomstr()
    returnContent = "return " + ContentArrayName + ";"
    Content = "NSArray *" + ContentArrayName + \
        " = @[" + contentValue + "];" + "\n" + returnContent
    ContentValues = "@[" + contentValue + "]"
    return ContentArrayName, ContentValues, Content,

def buildNSData():
    ContentDataName = getCihui2()+""+core.getrandomstr()
    contentValue = "\"" + core.getrandomstr(random.randint(38, 48)) + "\""
    returnContent = "return " + ContentDataName + ";"
    Content = "NSData *" + ContentDataName + \
        "=[@" + contentValue + " dataUsingEncoding:NSUTF8StringEncoding];" + "\n" + returnContent + "\n"
    ContentValues = "[@" + contentValue + \
        " dataUsingEncoding:NSUTF8StringEncoding]"
    return ContentDataName, ContentValues, Content,


def buildUIImage():
	# NSData * eyeEIcbnMDR = [@"nhoUCwOWDBkDEgVvmpGlZpDTTLUSwFVvwJklpTAbcgCrlgxOGscrbqozrQWNNqqqkXDeqGWXbxlEywnmbENvTQZzbqNqUORzpmMauloDSdGkFEEptpVXqtcuccLazQyDuvaiqPTqsvd" dataUsingEncoding:NSUTF8StringEncoding];
	# UIImage * pVMyRKrSHp = [UIImage imageWithData:eyeEIcbnMDR];
	# pVMyRKrSHp = [UIImage
	# imageNamed:@"deTqJnZGOnkMWbqpTYYShPdqARtlqvlwcbUVLsURGarKOGmEufYuaMCTMCsKwXGuTnVwKzSdDJutnUHJWYqdwUyYiKUabrAIQJHPQZluFpSAFQszCEYlSdzSxDBZQgHHFfHEVQBIzMjWghoeXTkEB"];
    dataName, dataValue, dataStr = buildNSData()
    Content1 = "NSData *" + dataName + "=" + dataValue + ";"
    ContentUIImageName = getCihui()+""+core.getrandomstr(random.randint(12, 26))
    Content2 = "UIImage *" + ContentUIImageName + \
        " = [UIImage imageWithData:" + dataName + "];"
    newImageValue = core.getrandomstr(random.randint(42, 56))
    Content3 = ContentUIImageName + \
        "= [UIImage imageNamed:@\"" + newImageValue + "\"];"
    ContentValues = "@[" + newImageValue + "]"
    #print Content1, Content2, Content3
    returnContent = "return " + ContentUIImageName + ";"
    Content = Content1 + "\n" + Content2 + "\n" + Content3 + "\n" + returnContent +"\n"
    return ContentUIImageName, ContentValues, Content

def buildNSMutableArray():
    ContentDataName = core.getrandomstr(10)
    NSNumName, NSNumValue, NSNumContent = buildNSNumber()
    NSNumValue = "NSNumber *" + NSNumName + \
        "=[NSNumber numberWithInt:" + NSNumValue + "];" + "\n"
    Content2 = "NSMutableArray *" + ContentDataName + \
        "=[NSMutableArray arrayWithObjects:" + NSNumName + ", nil];"
    returnContent = "return " + ContentDataName + ";"
    Content = NSNumValue + "\n" + Content2 + "\n" + returnContent + "\n"
    return ContentDataName, NSNumValue, Content,

def buildNSNumber():
    ContentDataName = core.getrandomstr()
    contentValue = str(random.randint(100000, 800000))
    returnContent = "return " + ContentDataName + ";"
    Content = "NSNumber *" + ContentDataName + \
        "=[NSNumber numberWithInt:" + contentValue + "];" +"\n" + returnContent + "\n"
    return ContentDataName, contentValue, Content,

def buildNSString():
    #NSString * mgCsubicztoPDGhAxX = @"XQwwkZHFOEUQHrZRAJvoEkSOqsmwSNut";
    ContentDataName = core.getrandomstr()
    contentValue = core.getrandomstr(random.randint(30, 50))
    returnContent = "return " + ContentDataName + ";"
    Content = "NSString *" + ContentDataName + \
        "=@\"" + contentValue + "\";" +"\n" +returnContent 
    return ContentDataName, contentValue, Content,


def buildNSInteger():
    ContentDataName = "11122"
    contentValue = "sdf"
    returnContent = "return " + ContentDataName + ";"
    Content = returnContent
    return ContentDataName, contentValue, Content,

#def templateFunc():
# int,NSInteger,NSString,CGFloat,BOOL,NSNumber，NSData，NSArray，NSDictionary，UIImage，NSObject
# assign,nonatomic,id,strong
#assign对NSInteger，CGFloat）和C数据类型（int, float, double, char）


def modelfunc():
    #"CGFloat","int", "float", "double", "char","BOOL",, "NSObject"
    allModel = ["void","NSString", "NSNumber", "NSData", "NSArray", "NSDictionary", "UIImage", "NSMutableArray"]
    modellen = len(allModel)
    key1 = random.randint(0, modellen - 1)
    return allModel[key1]


def modelModified():
    allModified = ["assign", "nonatomic", "strong"]
# func: -nsstring
#       -name
#tup2 = (1, 2, 3, 4, 5, 6, 7 );


def buildFuncName():
    funcDict = {}
    funcCount = random.randint(2, 9)
    for i in range(1, funcCount):
        ContentDataName = getCihui()+"" + core.getrandomstr(random.randint(4, 7))
        funcList = buildFuncValue()
        funcDict[ContentDataName] = funcList
    return funcDict

def buildFuncValue():
    funcKey = modelfunc()
    funcKeystr = "( " + funcKey + "*)"
    funcValue = core.getrandomstr(random.randint(5, 10)) 
    #NSData,- ( UIImage * ), application
    tmp = [funcKey, funcKeystr, funcValue]
    return tmp

#创建函数
def buildFuncAll():
    ContentFunc = ""
    listFunc = buildFuncValue()
    ContentFunc = "- " + listFunc[1]
    #print listFunc[0], listFunc[1], listFunc[2]
    funcDict = buildFuncName()
    for key in funcDict:
        ContentFunc = ContentFunc + " " + key + \
            ":" + funcDict[key][1] + funcDict[key][2]
    tmp = [listFunc[0], listFunc[1], ContentFunc]
    return tmp

def getTemplateAlgMethod():
    Temphead = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + \
        "TemplateAlg_m.txt"
    return core.loadFiles(Temphead)
def getTemplateFileMethod():
    Temphead = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + "TemplateClass_m.txt"
    return core.loadFiles(Temphead)

def getTemplateFileHead():
    Temphead = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + "TemplateClass_h.txt"
    return core.loadFiles(Temphead)

def getTemplateFileImportHead():
    Temphead = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + \
        "ImportClass_h.txt"
    return core.loadFiles(Temphead)

def getTemplateFileImportMethod():
    Temphead = file_utils.getCurFileDir() + '/buildCodeCof/newTemplate/' + \
        "ImportClass_m.txt"
    return core.loadFiles(Temphead)

def buildMethodHead(ClassList):
    Content = ""
    #     6756d90 * 6756d90 = [[6756d90 alloc] init];
    # [array addObject:6756d90];
    for className in ClassList:
        varl = core.getrandomstr()
        Content = Content + "\t" + className + "* " + varl + \
            "=" + "[[" + className + " alloc]init];" + "\n"
        Content = Content + "\t[array addObject: " + varl + "];\n"
    return Content

def buildImportHead(ClassList):
    Content = ""
    for className in ClassList:
        Content = Content + "#import " +"\""+ className + ".h"+ "\"" + "\n"
    return Content

cihuilist = []
def cihui():
    global cihuilist
    if len(cihuilist) == 0:
        TempTxt = file_utils.getCurFileDir() + '/buildCodeCof/jisuanjici.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        cihuilist = strCont.split('\n')

#0809
cihuilist_method0809 = []
def cihui_method0809():
    global cihuilist_method0809
    if len(cihuilist_method0809) == 0:
        TempTxt = file_utils.getCurFileDir() + '/buildCodeCof/jisuanjiClass22.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        cihuilist_method0809 = strCont.split('\n')

#0809
cihuilist_property0809 = []
def cihui_property0809():
    global cihuilist_property0809
    if len(cihuilist_property0809) == 0:
        TempTxt = file_utils.getCurFileDir() + '/buildCodeCof/jisuanjiClass33.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        cihuilist_property0809 = strCont.split('\n')

#1123
cihuilist_property1123 = []
def cihui_property1123():
    global cihuilist_property1123
    if len(cihuilist_property1123) == 0:
        TempTxt = file_utils.getCurFileDir() + '/buildCodeCof/words_list.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        cihuilist_property1123 = strCont.split('\n')

ciClassList = []
def ciClassFunc():
    global ciClassList
    if len(ciClassList) == 0:
        TempTxt = file_utils.getCurFileDir() + '/buildCodeCof/jisuanjiClass.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        ciClassList = strCont.split('\n')
        for i, val in enumerate(ciClassList):
            ciClassList[i] = str(val).rstrip('a').strip()

ciClassListA = []
def ciClassFuncA():
    global ciClassListA
    if len(ciClassListA) == 0:
        TempTxt = file_utils.getCurFileDir() + '/buildCodeCof/jisuanjiClass11.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        ciClassListA = strCont.split('\n')
        for i, val in enumerate(ciClassListA):
            # print("iiiiiiii== %s, val===== %s"%(i, val))
            ciClassListA[i] = str(val).rstrip('a').strip()


def GetClassFuncName():
    global ciClassList
    ciClassFunc()
    num1 = random.randint(0, len(ciClassList) - 1)
    # return ciClassList[num1] + getCihui2()

    key = random.randint(1,8) #"123456"
    if key == 1:
        return getCihui52() + getCihui2()
    elif key == 2:
        return getCihui52() + getCihui2() + getCihui2()
    elif key == 3:
        return getCihui52() + getCihui2() + getCihui2() + getCihui2()
    elif key == 4:
        return getCihui52() + getCihui2() + getCihui2() + getCihui_property1123()
    elif key == 5:
        return getCihui2()
    elif key == 6:
        return getCihui2() + getCihui_property1123()
    else :
        return getCihui_property1123() + getCihui2() + getCihui52()

ciClassList2 = []
def ciClassFunc2():
    global ciClassList2
    if len(ciClassList2) == 0:
        TempTxt = file_utils.getCurFileDir() + '/buildCodeCof/jisuanwaibulianyunClass.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        ciClassList2 = strCont.split('\n')
        for i, val in enumerate(ciClassList2):
            ciClassList2[i] = str(val).rstrip('a').strip()

def GetClassFuncName2():
    global ciClassList2
    ciClassFunc2()
    num1 = random.randint(0, len(ciClassList2) - 1)
    #return core.getrandomstr2()+ "" + getCihui()
    return getCihui()+ "" + getCihui()


def getCihui():
    global cihuilist
    cihui()
    num1 = random.randint(0, len(cihuilist)-1)
    num2 = random.randint(0, len(cihuilist) - 1)
    return cihuilist[num1] + ""+cihuilist[num2]

def getCihui2():
    global cihuilist
    cihui()
    num1 = random.randint(0, len(cihuilist)-1)
    return cihuilist[num1]

#0809
def getCihui_method0809():
    global cihuilist_method0809
    cihui_method0809()
    num1 = random.randint(0, len(cihuilist_method0809)-1)
    return cihuilist_method0809[num1]

#0809
def getCihui_property0809():
    global cihuilist_property0809
    cihui_property0809()
    num1 = random.randint(0, len(cihuilist_property0809)-1)
    return cihuilist_property0809[num1]

#1123
def getCihui_property1123():
    global cihuilist_property1123
    cihui_property1123()
    num1 = random.randint(0, len(cihuilist_property1123)-1)
    return cihuilist_property1123[num1]

def getCihui52():
    global ciClassListA
    ciClassFuncA()
    num1 = random.randint(0, len(ciClassListA)-1)
    return ciClassListA[num1]

def getCihui51():
    global cihuilist
    cihui()
    num1 = random.randint(0, len(cihuilist)-1)
    num2 = random.randint(0, len(cihuilist) - 1)
    key = cihuilist[num1].lower()
    return key + cihuilist[num2]

def getFuncInfo(outdir):
    funcCount = random.randint(12, 18)
    funcdict = {}
    for i in range(1, funcCount):
        funclist = buildFuncAll()
        funcdict[i] = funclist
    ClassName = core.getrandomstr2()+""+getCihui2()+""+core.getrandomstr(random.randint(3, 6))
    algheads= getFuncMethodInfo(outdir, ClassName, funcdict)
    getFuncHeadInfo(outdir, ClassName, funcdict, algheads)
    return ClassName

def setImportMethod(outdir, ImportClassName, ClassList):
    content = ""

    headContent = getTemplateFileImportMethod()
    #@classlist@
    #@useclasslist@
    listheadCont = buildImportHead(ClassList)
    listmethodCont = buildMethodHead(ClassList)
    headContent1 = re.sub("@classlist@", listheadCont, headContent)
    headContent2 = re.sub("@useclasslist@", listmethodCont, headContent1)
    newText = re.sub("@ImportClassName@", ImportClassName, headContent2)
    folderController = getOutputFolder(outdir)
    fileN = folderController + "/" + ImportClassName + ".m"
    core.writeFile(fileN, newText)

def setImportHead(outdir, ImportClassName, ClassList):
    content = ""
    headContent = getTemplateFileImportHead()
    newText = re.sub("@ImportClassName@", ImportClassName, headContent)
    folderController = getOutputFolder(outdir)
    fileN = folderController + "/" + ImportClassName + ".h"
    core.writeFile(fileN, newText)

def getOutputFolder(outdir="controller"):
    folderController = outdir  # file_utils.getCurFileDir() + "/" + outdir
    isExists = os.path.exists(folderController)
    if not isExists:
        os.makedirs(folderController)  # 创建关联文件夹
    return folderController

def getFuncHeadInfo(outdir, ClassName, funclist, algheads):
    #print funclist
    content = ""
    for key in funclist:
        #funclist[key]
        content = content + funclist[key][2] + ";\n"

    headContent = getTemplateFileHead()

    headContent1 = re.sub("@headfile@", "", headContent)
    headContent2 = re.sub("@ClassName@", ClassName, headContent1)
    
    #函数名
    content = content + "\n" + algheads

    newtext = re.sub("@funclistkey@", content, headContent2)
    folderController = getOutputFolder(outdir)
    fileN = folderController + "/" + ClassName + ".h"

    core.writeFile(fileN, newtext)


def getFuncMethodInfo(outdir,ClassName, funclist):
    content = ""
    algHeads = ""
    for key in funclist:
        #funclist[key]
        FuncContent = returnFuncContent(funclist[key])
        content = content + funclist[key][2] + " {\n" + FuncContent + "\n}\n"
        
        #随机添加算法函数
        alghead, algFunc = returnAlgFunc(modelAlgfunc())
        for algheadkey in alghead:
            algHeads = algHeads + str(algheadkey) + "\n"

        content = content + algFunc

    headContent1 = getTemplateFileMethod()
    # @headfile@
    # @ClassName@
    headContent2 = re.sub("@ClassName@", ClassName, headContent1)

    KeyvalueContent1 = re.sub("@classKeyValue1@", returnNSKey(), headContent2)
    KeyvalueContent2 = re.sub(
        "@classKeyValue2@", returnNSKey(), KeyvalueContent1)
    KeyvalueContent3 = re.sub(
        "@classKeyValue3@", returnNSKey(), KeyvalueContent2)

    valueContent1 = re.sub("@classValue1@", getCihui()+""+core.getrandomstr(random.randint(4, 6)), KeyvalueContent3)
    valueContent2 = re.sub("@classValue2@", getCihui(
    ) +""+core.getrandomstr(random.randint(4, 6)), valueContent1)
    valueContent3 = re.sub("@classValue3@", getCihui(
    ) +""+core.getrandomstr(random.randint(4, 6)), valueContent2)


    newtext = re.sub("@funclistvalue@", content, valueContent3)

    folderController = getOutputFolder(outdir)

    fileN = folderController + "/" + ClassName + ".m"
    core.writeFile(fileN, newtext)
    return algHeads

NSKey = ["NSString", "NSNumber", "NSArray", "NSDictionary", "UIImage", "NSData", "NSMutableArray", "NSInteger"]
def returnNSKey():
    global NSKey
    keynum = len(NSKey)
    return NSKey[random.randint(0, keynum-1)]

def returnFuncContent(funcargs):
    arg1 = funcargs[0]
    arg2 = funcargs[1]
    arg3 = funcargs[2]
    Content = ""
    if arg1 == "NSString":
        _, _, Content = buildNSString()
    elif arg1 == "NSNumber":
        _, _, Content = buildNSNumber()
    elif arg1 == "NSArray":
        _, _, Content = buildArray()
    elif arg1 == "NSDictionary":
        _, _, Content = buildDict()
    elif arg1 == "UIImage":
        _, _, Content = buildUIImage()
    elif arg1 == "NSData":
        _, _, Content = buildNSData()
    elif arg1 == "NSMutableArray":
        _, _, Content = buildNSMutableArray()
    elif arg1 == "NSInteger":
        _, _, Content = buildNSInteger()
    else:
        Content = "return nil;"
    return Content

def modelAlgfunc():
    allModel = ["buildbubbleSort111111", "buildbubbleSort", "buildselectionSort", "buildMergeSort",
                "buildBsearchWithourRec", "buildBinarySearch","buildQuickSort"]#["buildbubbleSort", "buildselectionSort", "buildMergeSort",
                #"buildBsearchWithourRec", "buildBinarySearch"]
    modellen = len(allModel)
    key1 = random.randint(0, modellen - 1)
    return allModel[key1]

def modelAlgfunc_num():
    allModel = ["buildbubbleSort111111", ]#["buildbubbleSort", "buildselectionSort", "buildMergeSort",
                #"buildBsearchWithourRec", "buildBinarySearch"]
    modellen = len(allModel)
    key1 = random.randint(0, modellen - 1)
    return allModel[key1]

def returnAlgFunc(funcargs):
    arg1 = funcargs
    Content = ""
    head = ""
    if arg1 == "buildbubbleSort":
        head, Content = alg.buildbubbleSort()
    elif arg1 == "buildselectionSort":
        head, Content = alg.buildselectionSort()
    elif arg1 == "buildInsertionSort":
        head, Content = alg.buildInsertionSort()
    elif arg1 == "buildMergeSort":
        head, Content = alg.buildMergeSort()
    elif arg1 == "buildBsearchWithourRec":
        head, Content = alg.buildBsearchWithourRec()
    elif arg1 == "buildBinarySearch":
        head, Content = alg.buildBinarySearch()
    elif arg1 == "buildbubbleSort111111":
        head, Content = alg.buildBinarySearch111()
    elif arg1 == "buildQuickSort":
        head, Content = alg.buildQuickSort()
    else:
        head, Content = ""
    return head, Content

#20200303
def returnAlgFunc_H(funcargs):
    arg1 = funcargs
    Content = ""
    head = ""
    head, Content = alg.buildbubbleSort_H()
    return head, Content

def returnAlgFunc_Num(funcargs):
    arg1 = funcargs
    Content = ""
    head = ""
    if arg1 == "buildbubbleSort111111":
        head, Content = alg.buildBinarySearch111()

    return head, Content

def strreplace(oldstr, newstr, content):
    return re.sub(oldstr, newstr, content)
