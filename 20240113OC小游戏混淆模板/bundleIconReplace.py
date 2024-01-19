#coding=utf-8
import re
import random
import sys
import file_utils
import os
import os.path
import string
import shutil
from biplist import *
import core
import buildCode

try:
        input = raw_input
except NameError:
        pass

def main(iconPath, srcdir, outdir, password):
    toiconPath = sys.path[0] + "/AiconFile/Resource.bundle"
    if os.path.exists(toiconPath):
        shutil.rmtree(toiconPath)
    shutil.copytree(iconPath, toiconPath)
    print(toiconPath, srcdir, outdir, password)
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    shutil.copytree(srcdir,
                    outdir, symlinks=True, ignore=shutil.ignore_patterns('.git'))
    addFiles = []
    fullDir = outdir
    if not os.path.exists(fullDir):
        print(u'Folder is noexit')

    igoreFiles = ['.git', 'build', 'png']
    igoreFileFullPaths = []

    for ifile in igoreFiles:
        fullpath = os.path.join(fullDir, ifile)
        igoreFileFullPaths.append(fullpath)

    addFiles = file_utils.list_files(fullDir, addFiles, igoreFileFullPaths)

    if len(addFiles) <= 0:
        return
    replaceCode(toiconPath, addFiles, password)

def replaceBundle(iconPath, outdir):
    fromPath = sys.path[0] + "/AiconFile/Resource.bundle"
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    shutil.copytree(fromPath, outdir)

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

#bundle所在路径
def replaceCode(iconPath, addFiles, password):
    nCount = 0
    plistN = iconPath #sys.path[0] + "/AiconFile/Sources.bundle"
    plistcont = os.listdir(plistN)
    for icon in plistcont:
        if icon.find("@") !=-1:
            s = "@"
            name1 = icon[0:icon.find(s)]
            name2 = icon[icon.find(s):]
        else:
            d = "."
            name1 = icon[0:icon.find(d)]
            name2 = icon[icon.find(d):]

        newrandkey = getRandName()

        oldkey = "\"" + name1 + "\""
        newkey = "\"" + newrandkey + "\""

        new_fileName = newrandkey + name2
        oldIconName = plistN + "/" + icon
        newIconName = plistN + "/" + newrandkey + name2
        newIconName1 = newrandkey + name2

        #更改图片MD5
        qual = random.uniform(80,99)
        os.system("convert -quality {} {} {}".format(qual,oldIconName,oldIconName))

        src = os.path.join(os.path.abspath(plistN), icon)
        dst = os.path.join(os.path.abspath(plistN), newIconName1)


        # if any(char.isdigit() for char in name1):
        #     print(f"图片名包含数字：{src}")
        #     if len(password) > 0:
        #         encrypargfile(src, password)
        # else:
        if len(password) > 0:
            encrypargfile(src, password)

        os.rename(src, dst)

        for fileN in addFiles:
            text = core.loadFiles(fileN)
            newtext = re.sub(oldkey, newkey, text)

            # pattern = re.compile(r'\"{0}\"'.format(name1))
            # newtext = re.sub(pattern, newkey, text)

            core.writeFile(fileN, newtext)






def replacePlist(dplist, plistpath, ourdir):
    try:
        (filepath, tempfilename) = os.path.split(plistpath)
        #(shotname, extension) = os.path.splitext(tempfilename)
        isExists = os.path.exists(ourdir)
        if not isExists:
            os.makedirs(ourdir)
        path = ourdir + "/" + tempfilename
        writePlist(dplist, path, False)
    except (InvalidPlistException, NotBinaryPlistException) as e:
        print("Not a plist:", e)

def savePlist(dplist, plistpath):
    try:

        writePlist(dplist, plistpath, True)
    except (InvalidPlistException, NotBinaryPlistException) as e:
        print("Not a plist:", e)

def getRandName():
    N = random.choice(range(1,50))
    if N < 10:
        str2 = buildCode.getCihui() + "" + core.getrandomstr(random.randint(4, 5))
        return str2.lower()
    elif N > 9 and N < 35:
        key = random.choice(range(1,3))
        if key == 1:
            str1 = buildCode.getCihui() + str(random.choice(range(1,100)))
            return str1.lower()
        else:
            ranKey = string.ascii_letters
            return buildCode.getCihui2() + random.choice(ranKey)
    else:
        str3 = buildCode.getCihui()
        return str3.lower()
