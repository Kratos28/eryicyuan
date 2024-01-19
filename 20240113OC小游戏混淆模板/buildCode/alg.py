#coding=utf-8

import random
import string
import core
import file_utils
import buildCode
import buildSdkCode

def getAlgFuncName():

    key = "12345"
    ranKey = string.ascii_lowercase
    if random.choice(key) == "1":
        key1 = buildCode.getCihui2()
        return key1.lower() + buildCode.getCihui_method0809()
    elif random.choice(key) == "2":
        key1 = buildCode.getCihui2()
        return key1.lower() + random.choice(ranKey) +  buildCode.getCihui_method0809()
    elif random.choice(key) == "3":
        key1 = buildCode.getCihui2()
        return key1.lower() + buildCode.getCihui_method0809() +  buildCode.getCihui2()
    elif random.choice(key) == "4":
        key1 = buildCode.getCihui2()
        return random.choice(ranKey) + random.choice(ranKey) + buildCode.getCihui_method0809()
    else :
        return random.choice(ranKey) +  buildCode.getCihui_method0809() + random.choice(ranKey)

def buildbubbleSort():
    arrayCount = random.randint(2, 5)

    arrayStr = ""
    # int array[10] = {24, 17, 85, 13, 9, 54, 76, 45, 5, 63}
    # int num = sizeof(array) / sizeof(int)
    for i in range(0, arrayCount):
        if(i == arrayCount-1):
            arrayStr = arrayStr + str(random.randint(1, 99999))
        else:
            arrayStr = arrayStr + str(random.randint(1, 99999)) + ","
        
    funcName = getAlgFuncName()
    argval1 = core.getrandomstr_alg_parm()
    argval2 = core.getrandomstr_alg_parm()
    Content = getFuncStr("buildbubbleSort")
    Content = buildCode.strreplace("@funcname@", funcName, Content)
    Content = buildCode.strreplace("@argval1@", argval1, Content)
    Content = buildCode.strreplace("@argval2@", argval2, Content)

    headContent = getFunc1HeadStr(Content)
    headArray = [headContent,"1" ]
    return headArray, Content

#20200303 随机 增加属性
def buildbubbleSort_H():


    num = random.randint(1, 18)
    if num == 1:
        Content = "@property (nonatomic, strong) NSData *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 2:
        Content = "@property (nonatomic, strong) NSArray *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 3:
        Content = "@property (nonatomic, copy) NSMutableArray *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 4:
        Content = "@property (nonatomic, strong) NSDictionary *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 5:
        Content = "@property (nonatomic, copy) NSMutableDictionary *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 6:
        Content = "@property (nonatomic, strong) NSURL *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 7:
        Content = "@property (nonatomic, assign) NSInteger " + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 8:
        Content = "@property (nonatomic, assign) CGPoint " + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 9:
        Content = "@property (nonatomic, strong) UILabel *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 10:
        Content = "@property (nonatomic, strong) UIImageView *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 11:
        Content = "@property (nonatomic, strong) UIView *" + buildSdkCode.getAlgPropertyName() + ";\n"
    elif num == 12:
        Content = "@property (nonatomic, strong) UIButton *" + buildSdkCode.getAlgPropertyName() + ";\n"
    else :
        Content = "@property (nonatomic, strong) NSString *" + buildSdkCode.getAlgPropertyName() + ";\n"

    headContent = "" #getFunc1HeadStr(Content)
    headArray = [headContent, "1"]
    return headArray, Content

#选择排序
def buildselectionSort():
    funcName = getAlgFuncName()
    argval1 = core.getrandomstr_alg_parm()
    argval2 = core.getrandomstr_alg_parm()
    Content = getFuncStr("buildselectionSort")
    Content = buildCode.strreplace("@funcname@", funcName, Content)
    Content = buildCode.strreplace("@argval1@", argval1, Content)
    Content = buildCode.strreplace("@argval2@", argval2, Content)
    headContent = getFunc1HeadStr(Content)
    headArray = [headContent,"1" ]
    return headArray, Content

def buildInsertionSort():
    Content = getFuncStr("buildInsertionSort")
    headContent = getFunc1HeadStr(Content)
    headArray = [headContent,"1" ]
    return headArray, Content


def buildQuickSort():
    funcName = getAlgFuncName()
    argval1 = core.getrandomstr_alg_parm()
    argval2 = core.getrandomstr_alg_parm()
    argval3 = core.getrandomstr_alg_parm()

    Content = getFuncStr("buildQuickSort")

    Content = buildCode.strreplace("@funcname@", funcName, Content)
    Content = buildCode.strreplace("@argval1@", argval1, Content)
    Content = buildCode.strreplace("@argval2@", argval2, Content)
    Content = buildCode.strreplace("@argval3@", argval3, Content)
    headContent = getFunc1HeadStr(Content)
    headArray = [headContent,"1" ]
    return headArray,Content


def buildMergeSort():
    Content = getFuncStr("buildMergeSort")
    funcName = getAlgFuncName()
    funcName2 = getAlgFuncName()

    argval1 = core.getrandomstr_alg_parm()
    argval2 = core.getrandomstr_alg_parm()
    argval3 = core.getrandomstr_alg_parm()
    argval4 = core.getrandomstr_alg_parm()
    argval5 = core.getrandomstr_alg_parm()

    Content = buildCode.strreplace("@funcname@", funcName, Content)
    Content = buildCode.strreplace("@funcname2@", funcName2, Content)
    Content = buildCode.strreplace("@argval1@", argval1, Content)
    Content = buildCode.strreplace("@argval2@", argval2, Content)
    Content = buildCode.strreplace("@argval3@", argval3, Content)
    Content = buildCode.strreplace("@argval4@", argval4, Content)
    Content = buildCode.strreplace("@argval5@", argval5, Content)
    headContent = getFunc1HeadStr(Content)
    headContent2 = getFunc2HeadStr(Content)

    # print headContent
    # print headContent2
    # print Content
    headArray = [headContent,"1"]
    return headArray, Content


def buildBsearchWithourRec():
    Content = getFuncStr("buildBsearchWithourRec")
    funcName = getAlgFuncName()

    argval1 = core.getrandomstr_alg_parm()
    argval2 = core.getrandomstr_alg_parm()
    argval3 = core.getrandomstr_alg_parm()
    argval4 = core.getrandomstr_alg_parm()

    Content = buildCode.strreplace("@funcname@", funcName, Content)

    Content = buildCode.strreplace("@argval1@", argval1, Content)
    Content = buildCode.strreplace("@argval2@", argval2, Content)
    Content = buildCode.strreplace("@argval3@", argval3, Content)
    Content = buildCode.strreplace("@argval4@", argval4, Content)
    headContent = getFunc1HeadStr(Content)
    headArray = [headContent,"1" ]
    return headArray,Content


def buildBinarySearch():
    Content = getFuncStr("buildBinarySearch")

    funcName = getAlgFuncName()

    argval1 = core.getrandomstr_alg_parm()
    argval2 = core.getrandomstr_alg_parm()
    argval3 = core.getrandomstr_alg_parm()
    argval4 = core.getrandomstr_alg_parm()

    Content = buildCode.strreplace("@funcname@", funcName, Content)

    Content = buildCode.strreplace("@argval1@", argval1, Content)
    Content = buildCode.strreplace("@argval2@", argval2, Content)
    Content = buildCode.strreplace("@argval3@", argval3, Content)
    Content = buildCode.strreplace("@argval4@", argval4, Content)
    headContent = getFunc1HeadStr(Content)
    headArray = [headContent,"1" ]
    return headArray,Content

def buildBinarySearch111():
    Content = getFuncStr("buildbubbleSort111111")

    headContent = Content
    headArray = [headContent,"buildBinarySearch111" ]
    return headArray,Content
#获取代码片段


def getFuncStr(Key):
    KeyBegin = "@" + Key + "@Begin"
    KeyEnd = "@" + Key + "@End"
    Content = buildCode.getTemplateAlgMethod()
    name = Content[Content.rfind(KeyBegin) + len(
        KeyBegin):Content.rfind(KeyEnd)]
    return name

def getFunc1HeadStr(Content):
    KeyBegin = "//" + "1" + "@"
    KeyEnd = "//" + "2" + "@"
    name = Content[Content.find(KeyBegin) + len(KeyBegin):Content.find(KeyEnd)] + ";"
    return name

def getFunc2HeadStr(Content):
    KeyBegin = "//" + "3" + "@"
    KeyEnd = "//" + "4" + "@"
    name = Content[Content.find(KeyBegin) + len(KeyBegin):Content.find(KeyEnd)] + ";"

def getAttr(cont):
    allModel = ["void","BOOL", "NSUInteger", "NSString", "NSNumber", "NSData", "NSArray",
                "NSDictionary", "UIImage", "NSMutableArray"]
    isBool = False            
    for key in allModel:
        if cont.find(key)!=-1:
            #print "找到key:" + key + ":" + cont
            isBool = True

    return isBool


def getFuncName(Content):
    #1.成员还是类函数+/-
    #2.函数回调属性（void， 符合才执行下一步
    #3.函数名称application:
    #4.函数多个函数值
    #5.截取成员函数的类型
    KeyBegin = "-"
    KeyEnd = "("
    n1 = Content.find(KeyBegin)
    n2 = Content.find(KeyEnd, n1)
    cont1 = Content[n1:n2]
    funcList = []
    ArgList = []
    isBool = False
    if cont1.find("-", 0) != -1:
        KeyBegin = "("
        KeyEnd = ")"
        n1 = Content.find(KeyBegin) + 1
        n2 = Content.find(KeyEnd, n1)
        cont2 = Content[n1:n2]

        if(getAttr(cont2)):
            cont22 = Content[n2 + 1:]
            print cont22
            isBool = True
            #print isBool
            #如果是无参函数
            if(cont22.find(":", 0) == -1):
                cont33 = cont22[:cont22.find("{", 0)]
                key1 = cont33.replace(' ', '')  # 函数名
                if(key1 != ""):
                    funcList.append(key1)
                #print cont33
            else:  # 其他有参数的函数
                cont33 = cont22[:cont22.find("{", 0)]  # 前函数
                cont44 = cont33.split(':')  # 分割函数
                print cont44
                for key in cont44:
                    openK = key.rfind(" ")
                    if openK == -1:  # 找不到空格时处理
                        if len(cont44) == 1:
                            key.replace(' ', '')
                            funcList.append(key)
                        elif len(cont44) == 2:  # 如何是没空格就有可能是函数名，而且只有一个函数
                            if(key != "" and key.find("(") == -1):  # 括号的是参数
                                funcList.append(key)
                            else:
                                ArgList.append(key)
                        else:  # 其他处理方式
                            if(key != "" and key.find("(") == -1):  # 括号的是参数
                                funcList.append(key)
                            else:
                                ArgList.append(key)
                    else:
                        if len(cont44) == 1:
                            key.replace(' ', '')
                            funcList.append(key)
                        elif len(cont44) == 2:  # 如何是没空格就有可能是函数名，而且只有一个函数
                            if(key != "" and key.find("(") == -1):  # 括号的是参数
                                funcList.append(key)
                            else:
                                ArgList.append(key)
                        else:  # 其他处理方式
                            key1 = key[openK:].replace(' ', '')  # 函数名
                            key2 = key[:openK].replace(' ', '')  # 函数参数名
                            if(key1 != ""):
                                funcList.append(key1)
                            if(key2 != ""):
                                ArgList.append(key2)

    elif cont1.find("+") != -1:
        print "2233"
    if len(funcList) == 0:
        isBool = False

    return isBool, funcList, ArgList

def getFuncNameTest():
    Temphead = file_utils.getCurFileDir() + '/test/MBProgressHUD.m'
    Content = core.loadFiles(Temphead)
    Arrlist = Content.split('\n')
    for key in Arrlist:
        isBool, funclist, arglist = getFuncName(key)
        if isBool :
            print "111------------"
            print funclist
            print arglist
            print "222------------"
            if((len(funclist) != len(arglist)) and len(funclist)!=1):
                print "err"

def getHeadFuncNameTest():
    Temphead = file_utils.getCurFileDir() + '/test/MBProgressHUD.h'
    Content = core.loadFiles(Temphead)
    #getHeadFuncInCont(Content)
    Arrlist = getHeadFuncInCont(Content) #Content.split('\n')
    print Arrlist
    for key in Arrlist:
        isBool, funclist, arglist = getHeadFuncName(key)
        if isBool:
            print "111------------"
            print funclist
            print arglist
            print "222------------"
            if((len(funclist) != len(arglist)) and len(funclist) != 1):
                print "err"

#截取文件中可能是函数的字符串
def getHeadFuncInCont(Cont):
    Arrlist = Cont.split('\n')
    return Arrlist
    # Arrlist2 = []
    # func1 = ""
    # func2 = ""
    # for key in Arrlist:
    #     Content = key
    #     KeyBegin = "-"
    #     KeyEnd = "("
    #     n1 = Content.find(KeyBegin)
    #     n2 = Content.find(KeyEnd, n1)
    #     cont1 = Content[n1:n2]
    #     isBool = False

    #     if cont1.find("-", 0) != -1 or cont1.find("+", 0) != -1:
    #         KeyBegin = "("
    #         KeyEnd = ")"
    #         n1 = Content.find(KeyBegin) + 1
    #         n2 = Content.find(KeyEnd, n1)
    #         cont2 = Content[n1:n2]
    #         if(getAttr(cont2)):
    #             #如果找不到;结尾有可能在第二行
    #             if Content.find(";") == -1:
    #                 func1 = Content
    #             else:
    #                 func2 = func1 + Content
    #                 Arrlist2.append(func2)
    #                 func1=""
    #                 func2=""

    # return Arrlist2


#分解字符串函数
def getHeadFuncName(Content):
    #1.成员还是类函数+/-
    #2.函数回调属性（void， 符合才执行下一步
    #3.函数名称application:
    #4.函数多个函数值
    #5.截取成员函数的类型
    KeyBegin = "-"
    KeyEnd = "("
    n1 = Content.find(KeyBegin)
    n2 = Content.find(KeyEnd, n1)
    cont1 = Content[n1:n2]
    funcList = []
    ArgList = []
    isBool = False
    if cont1.find("-", 0) != -1 or cont1.find("+", 0) != -1:
        KeyBegin = "("
        KeyEnd = ")"
        n1 = Content.find(KeyBegin) + 1
        n2 = Content.find(KeyEnd, n1)
        cont2 = Content[n1:n2]

        if(getAttr(cont2)):
            cont22 = Content[n2 + 1:]
            print cont22
            isBool = True
            #print isBool
            #如果是无参函数
            if(cont22.find(":", 0) == -1):
                cont33 = cont22[:cont22.find(";", 0)]
                key1 = cont33.replace(' ', '')  # 函数名
                if(key1 != ""):
                    funcList.append(key1)
                #print cont33
            else:  # 其他有参数的函数
                cont33 = cont22[:cont22.find(";", 0)]  # 前函数
                cont44 = cont33.split(':')  # 分割函数
                #print cont44
                for key in cont44:
                    openK = key.rfind(" ")
                    if openK == -1:  # 找不到空格时处理
                        if len(cont44) == 1:
                            key.replace(' ', '')
                            funcList.append(key)
                        elif len(cont44) == 2:  # 如何是没空格就有可能是函数名，而且只有一个函数
                            if(key != "" and key.find("(") == -1):  # 括号的是参数
                                funcList.append(key)
                            else:
                                ArgList.append(key)
                        else:  # 其他处理方式
                            if(key != "" and key.find("(") == -1):  # 括号的是参数
                                funcList.append(key)
                            else:
                                ArgList.append(key)
                    else:
                        if len(cont44) == 1:
                            key.replace(' ', '')
                            funcList.append(key)
                        elif len(cont44) == 2:  # 如何是没空格就有可能是函数名，而且只有一个函数
                            if(key != "" and key.find("(")==-1): #括号的是参数
                                funcList.append(key)
                            else:
                                ArgList.append(key)
                        else:   #其他处理方式  
                            key1 = key[openK:].replace(' ', '')  # 函数名
                            key2 = key[:openK].replace(' ', '')  # 函数参数名
                            if(key1 != ""):
                                funcList.append(key1)
                            if(key2 != ""):
                                ArgList.append(key2)

    elif cont1.find("+") != -1:
        print "2233"
    if len(funcList) == 0:
        isBool = False

    return isBool, funcList, ArgList
