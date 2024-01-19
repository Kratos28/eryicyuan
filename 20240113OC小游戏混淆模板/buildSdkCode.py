#!/usr/bin/env python
# coding=utf-8
import buildCode
import sys
import argparse
import stat
import buildCodeExt
import file_utils
import os
import os.path
import core
import random
import string
import shutil
import plistreplace
import comments_delete
import AddAlgCodes
from biplist import *
import bundleIconReplace

def cur_file_dir():
   path = sys.path[0]
   print(path)
   if os.path.isdir(path):
        return path
   elif os.path.isfile(path):
        return os.path.dirname(path)

def mainH5Code(srcdir, outdir, password):
    H5fixCode(srcdir, outdir, password)

def getClassName():
    return buildCode.GetClassFuncName()
#方法名
def getAlgFuncName():

    num = random.randint(1,8)
    if num == 1:
        str = buildCode.getCihui2()
        return str.lower() + "" + buildCode.getCihui_method0809()
    elif num ==2:
        str = buildCode.getCihui2()
        return str.lower() + buildCode.getCihui2()
    elif num ==3:
        str = core.getrandomstr51()
        return str.lower() + buildCode.getCihui2()
    elif num ==4:
        str = core.getrandomstr51().lower()
        return str.lower() + buildCode.getCihui2() + buildCode.getCihui_method0809()
    elif num ==5:
        str = buildCode.getCihui_property1123()
        return str.lower() + buildCode.getCihui_method0809()
    elif num ==6:
        str = buildCode.getCihui_property1123()
        return str.lower() + buildCode.getCihui2()
    else :
        ranKey1 = string.ascii_lowercase
        return random.choice(ranKey1) + buildCode.getCihui_method0809()
#属性名
def getAlgPropertyName():
    key = random.randint(1,7)
    if key == 1:
        ranKey = string.ascii_lowercase
        str = buildCode.getCihui_property0809()
        return random.choice(ranKey) + str
    elif key == 2:
        str = buildCode.getCihui2()
        return str.lower() + buildCode.getCihui_property0809()
    elif key == 3:
        ran2 = string.ascii_letters
        return buildCode.getCihui_property0809() + random.choice(ran2)
    elif key == 4:
        return buildCode.getCihui_property0809()
    elif key == 5:
        return buildCode.getCihui2() + buildCode.getCihui_property1123()
    else :
        ran1 = string.ascii_uppercase
        return buildCode.getCihui_property0809() + random.choice(ran1) + random.choice(ran1)

def setPlistFile(srcdir, outdir):
    plistfile = [outdir + "/testProj/AAA.txt"]

    codeDir = outdir + ""
    codeOutDir = outdir + "New/"
    plistOutDir = codeOutDir + "/testProj/"
    #处理配置表中的字符串
    plistreplace.main(plistfile, plistOutDir, codeDir, codeOutDir)
    #删除原来的目录
    core.delete_file(codeDir)
    os.rename(codeOutDir, codeDir)

def FixCode(srcdir, outdir):
    codeDir = outdir + ""
    codeOutDir = outdir + "New/"
    buildCodeExt.mainfixCode(codeDir, codeOutDir)
    #删除原来的目录
    core.delete_file(codeDir)
    os.rename(codeOutDir, codeDir)

#删除注释
def delete_commentsCode(srcdir, outdir):
    codeDir = outdir + ""
    codeOutDir = outdir + "New/"
    plistOutDir = codeOutDir + "/testProj/testProj/"
    comments_delete.mainComments(plistOutDir, codeDir, codeOutDir)
    #删除原来的目录
    core.delete_file(codeDir)
    os.rename(codeOutDir, codeDir)

def aAddAlgCodes(srcdir, outdir,count, code_type):
    codeDir = outdir + ""
    codeOutDir = outdir + "New/"
    plistOutDir = codeOutDir + "/testProj/testProj/"
    AddAlgCodes.mainComments(plistOutDir, codeDir, codeOutDir,count,code_type)
    #删除原来的目录
    core.delete_file(codeDir)
    os.rename(codeOutDir, codeDir)

def setBundleImageFile(srcdir, outdir, password):
    iconPath = srcdir + "/testProj/Resource.bundle"
    codeDir = outdir + ""
    codeOutDir = outdir + "New/"
    bundleIconReplace.main(iconPath, codeDir, codeOutDir, password)
    core.delete_file(codeDir)
    os.rename(codeOutDir, codeDir)
    
def replaceBundleFile(srcdir, outdir):
    iconPath = outdir + "/testProj/Resource.bundle"
    bundleIconReplace.replaceBundle(srcdir, iconPath)
    

def H5fixCode(srcdir, outdir, password):

    SrcFullPath = srcdir
    OutFullPath = outdir
    if os.path.exists(OutFullPath):
        #递归删除文件夹下的所有子文件夹和子文件
        shutil.rmtree(OutFullPath)

    shutil.copytree(SrcFullPath,
                    OutFullPath, symlinks=True, ignore=shutil.ignore_patterns('.git', 'SDKStatic'))
    addFiles = []
    fullDir = outdir 
    if not os.path.exists(fullDir):
        print ("ff")
        # print u'Folder is noexit'

    igoreFiles = ['.git', 'build']
    igoreFileFullPaths = []

    for ifile in igoreFiles:
        fullpath = os.path.join(fullDir, ifile)
        igoreFileFullPaths.append(fullpath)

    addFiles = file_utils.list_files(fullDir, addFiles, igoreFileFullPaths)

    if len(addFiles) <= 0:
        return
    print ('修改plist')
    setPlistFile(srcdir, outdir)
    print ('修改类')
    changeFile(fullDir,addFiles)
    print ('删除注释')
    delete_commentsCode(srcdir, outdir)
    print('修改bundle图片名...')
    # 加密图片密码，如果为"",则不加密
    setBundleImageFile(srcdir, outdir, password)
    print ('插入代码段')
    # 1、count:随机插入代码数量：总数*1/count， 2、code_type=1表示增加方法，2不增加
    aAddAlgCodes(srcdir, outdir, count=random.randint(3,8), code_type=random.randint(1,2))
    print ('增加函数')
    FixCode(srcdir, outdir)
    # 移动bundle文件
    replaceBundleFile(srcdir, outdir)
    print('混淆完成！！图片加密密码---{0}'.format(password))

def encrypargfile(filepath, passwd):
    curDir = cur_file_dir()
    xorfile = curDir + "/xor/" + "encryp"
    cmdline = xorfile + " " + filepath + " " + passwd
#    print(cmdline)
    os.system(cmdline)

def changeFile(fullDir, filelist):
    dictNewFile = {}
    plistcont = readPlist(fullDir+ "/ClassStringsReplace.plist")
    #方法名
    changeName = plistcont["changeKey"]
    for iName, Value in changeName.items():
        iNameExt = getAlgFuncName()

        dictNewFile[iName] = iNameExt
        for iFile in filelist:
            Content = core.loadFiles(iFile)
            Content = Content.replace(iName, iNameExt)
            #保存到新文件
            core.writeFile(iFile, Content)
    #属性名
    changePropertyName = plistcont["changeProperty"]
    for iName, Value in changePropertyName.items():
        iNameExt = getAlgPropertyName()
        
        dictNewFile[iName] = iNameExt
        for iFile in filelist:
            Content = core.loadFiles(iFile)
            Content = Content.replace(iName, iNameExt)
            #保存到新文件
            core.writeFile(iFile, Content)

    #类名
    changeClass = plistcont["changeClass"]
    for iName, Value in changeClass.items():
        iNameExt = getClassName()

        dictNewFile[iName] = iNameExt
        for iFile in filelist:
            Content = core.loadFiles(iFile)
            Content = Content.replace(iName, iNameExt)
            #保存到新文件
            core.writeFile(iFile, Content)

    #修改文件名
    for fileName in dictNewFile:
        for iFile in filelist:
            firsePos = iFile.rfind(fileName)
            newFile = iFile
            if firsePos != -1:
#                newFile = iFile.replace(fileName, dictNewFile[fileName])
#                shutil.copyfile(iFile, newFile)
#                os.remove(iFile)
                file_dir, old_file_name = os.path.split(iFile)
                temp_name = old_file_name.replace(fileName, dictNewFile[fileName])
                newFile = os.path.join(file_dir, temp_name)

                if iFile == newFile:
                    continue
                if not os.path.exists(iFile):
                    continue
                shutil.copyfile(iFile, newFile)
                os.remove(iFile)

#自动修改jssj code
if __name__ == "__main__":
    parser = argparse.ArgumentParser(u"iOS SDK 工程修改 工具")
    parser.add_argument('-d', '--dir', help=u"目标目录",
                        action="store", dest="dir", default="./")
    parser.add_argument('-o', '--out', help=u"输出目录",
                        action="store", dest="out", default="./out")
    parser.add_argument('-password', '--password', help=u"输出目录",
                        action="store", dest="password", default="")
    args = parser.parse_args()
    mainH5Code(args.dir, args.out, args.password)
    print ("args.dir == " + str(args.dir)) #args.dir == ./testProj
    print ("args.out == " + str(args.out)) #args.out == ./testProj2
