#!/usr/bin/python
# -*- coding: UTF-8 -*-

import sys
import re
import os
import io
import string
import argparse
import file_utils

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

def alfGetlines(file_content):
    lines = file_content.split('\n')
    cleaned_lines = []
    for line in lines:
        if len(line.strip()) != 0:
            cleaned_lines.append(line)
    return cleaned_lines #list(set(cleaned_lines))
#删除注释
def filter_useless_chars(file_content):
    # 移除单行注释和多行注释
    def _remove_comments(string):
        pattern = r"(\".*?\"|\'.*?\')|(/\*.*?\*/|//[^\r\n]*$)"
        regex = re.compile(pattern, re.MULTILINE | re.DOTALL)

        def _replacer(match):
            if match.group(2) is not None:
                return ""
            else:
                return match.group(1)

        return regex.sub(_replacer, string)

    file_str = _remove_comments(file_content)
    return file_str

propertylist = []
methodslist = []
def huoquPath(sicdir,outdir):
    addFiles = []
    igoreFiles = ['.git', 'build']
    igoreFileFullPaths = []
    syscihui()
    for ifile in igoreFiles:
        fullpath = os.path.join(sicdir, ifile)
        igoreFileFullPaths.append(fullpath)

    # addFiles = file_utils.list_files(sicdir, addFiles, igoreFileFullPaths)
    addFiles = file_utils.list_filesforext(sicdir, addFiles, igoreFileFullPaths, ".m")
#    addFiles = file_utils.list_filesforext(sicdir, addFiles, igoreFileFullPaths, ".mm")
    if len(addFiles) > 0:
        checkCodes(sicdir, addFiles)

    addFiles_h = file_utils.list_filesforext(sicdir, addFiles, igoreFileFullPaths, ".h")
    if len(addFiles_h) > 0:
        checkCodes_h(sicdir, addFiles_h)

def getCurFileDir():
    path = sys.path[0]
    if os.path.isdir(path):
        return path
    elif os.path.isfile(path):
        return os.path.dirname(path)

syscihuilist = []
def syscihui():
    global syscihuilist
    if len(syscihuilist) == 0:
        TempTxt = getCurFileDir() + '/system_identifiers.txt'
        readcihuifile = open(TempTxt, 'r')
        strCont = readcihuifile.read()
        asyscihuilist = strCont.split('\n')
        syscihuilist = list(set(asyscihuilist)) #排重

def checkCodes_h(sicdir,filelist):
    global propertylist
    global methodslist
    # print(len(propertylist))
    for iFile in filelist:
        Content = loadFiles(iFile)
        Content = filter_useless_chars(Content)
        Contents = alfGetlines(Content)
        for line_content in Contents:
            # @property
            if line_content.startswith('@property'):
                pattern_search_property = re.compile(r'[\s+|*](\w*);$')
                matches_property = re.findall(pattern_search_property, line_content)
                if matches_property:
                    for match in matches_property:
                        if '_' in match:
                            propertylist += matches_property
        # 属性
        if propertylist:
            anewlist = list(set(propertylist))
            system_intersect_identifiers = list(set(syscihuilist).intersection(set(anewlist)))
            aanewlist = list(set(anewlist).difference(set(system_intersect_identifiers)))

            identifiers = list(set(methodslist).intersection(set(aanewlist)))
            newlist = list(set(aanewlist).difference(set(identifiers)))

            newlist.sort(key=lambda i: len(i), reverse=True)
            # newlist.sort(key=propertylist.index)
            trans_dict_to_xml_new(newlist, sicdir, "propertys.txt")
            # dict = {}
            # for lstr in newlist:
            #     dict[lstr] = lstr
            # if dict:
            #     # print(dict)
            #     trans_dict_to_xml(dict, sicdir, "propertys.txt")


# def parse_system_identifiers(self):
#     system_file_paths = ConfuseBiz.scan_path(self.system_file_dirs, None, ['h'])
#     system_identifiers = []
#     for file_path, filename in system_file_paths:
#         identifier_array = self.__parse_system_file_content(file_path, filename)
#         if len(identifier_array):
#             system_identifiers += identifier_array
#
#     # 对字典去重并排序
#     return sorted(list(set(system_identifiers)))

def checkCodes(sicdir,filelist):
    global methodslist
    classeslist = []
    global propertylist
    global syscihuilist
    print(len(propertylist))
    for iFile in filelist:
        Content = loadFiles(iFile)
        Content = filter_useless_chars(Content)
        Contents = alfGetlines(Content)

        # system_intersect_identifiers = list(set(syscihuilist).intersection(set(diff_identifiers)))
        # Contents = list(set(diff_identifiers).difference(set(system_intersect_identifiers)))
        #获取@implementation
        imple_line = re.findall(r"@implementation(.+?)\n", Content)
        if imple_line:
            str1 = imple_line[0]
            string = str1.replace(" ", "")
            # print(string)
            if str(string).find("(") == -1:
                # if '_' in string:
                 classeslist.append(string)

        for line_content in Contents:

            # 去除后面的注释
            search_comment_index = line_content.find('//')
            if search_comment_index != -1:
                line_content = line_content[:search_comment_index - 1]
            # 单行注释、宏定义内容不用管
            if line_content.startswith('#'):
                continue
            # xib连线不用管
            if 'IBAction' in line_content:
                continue
            # init开头的方法不用管
            if 'init' in line_content:
                continue

            # @property
            if line_content.startswith('@property'):
                pattern_search_property = re.compile(r'[\s+|*](\w*);$')
                matches_property = re.findall(pattern_search_property, line_content)
                if matches_property:
                    for match in matches_property:
                        # if '_' in match:
                        propertylist += matches_property

            # 局部变量
            if '_' in line_content:
                pattern_search_tempvar = re.compile(r'\w+\s+\*?\s?(\w+_\w*) =')
                matches_tempvar = re.findall(pattern_search_tempvar, line_content)
                if matches_tempvar:
                    for match in matches_tempvar:
                        # if '_' in match:
                        propertylist += matches_tempvar

            # 方法名
            if '+' in line_content or '-' in line_content:
                # line_content = line_content.replace(" ", "")
                # line_list = re.findall(r"[-+](.*){",line_content)
                # line_list1 = re.findall(r"[-+](\w*):",line_content)
                # if line_list:
                #     if str(line_list).find("\)"):
                #         line_list = re.sub(r"\((.*)\)","",line_list)
                #         methodslist.append(line_list)
                # if line_list1:
                #     if str(line_list1).find("{"):
                #         methodslist.append(line_list1)

                func_regex = '\s*(\w+)\s*:\s*\(\s*\w*\s*\s*\w+\s*\*?\s*\)\s*\w+\s*'
                # 不带参数
                func_simple_regex = '\s*[-\+]\s*\(\s*\w+\s*\*?\)\s*(\w+)\s*;*'
                matches = re.findall(func_regex, line_content)
                if len(re.findall(func_simple_regex, line_content)) >= 1:
                    matches += re.findall(func_simple_regex, line_content)
                if matches:
                    for match in matches:
                        # set、get、_开头的方法不用管
                        if re.match(r'^set|^get|^_', match):
                            continue
                        # 去除中文
                        zh_pattern = re.compile(u'[\u4e00-\u9fa5]+')
                        if zh_pattern.search(match):
                            continue
                        # 去除纯数字
                        if match.isdigit():
                            continue
                        # if '_' in match:
                        methodslist.append(match)



    #类名
    if classeslist:
        anewlist = list(set(classeslist))
        system_intersect_identifiers = list(set(syscihuilist).intersection(set(anewlist)))
        newlist = list(set(anewlist).difference(set(system_intersect_identifiers)))
        # newlist.sort(key=classeslist.index)
        newlist.sort(key=lambda i:len(i), reverse=True)

        trans_dict_to_xml_new(newlist, sicdir, "classes.txt")
        # dict = {}
        # for lstr in newlist:
        #     dict[lstr] = lstr
        # if dict:
        #     # print(dict)
        #     trans_dict_to_xml(dict,sicdir,"classes.txt")
    #属性
    if propertylist:
        anewlist = list(set(propertylist))
        system_intersect_identifiers = list(set(syscihuilist).intersection(set(anewlist)))
        newlist = list(set(anewlist).difference(set(system_intersect_identifiers)))
        newlist.sort(key=lambda i:len(i), reverse=True)
        # trans_dict_to_xml_new(newlist, sicdir, "propertys.txt")
        # newlist.sort(key=propertylist.index)
        # dict = {}
        # for lstr in newlist:
        #     dict[lstr] = lstr
        # if dict:
        #     # print(len(dict))
        #     trans_dict_to_xml(dict,sicdir,"propertys.txt")

    #方法
    if methodslist:
        anewlist = list(set(methodslist))
        system_intersect_identifiers = list(set(syscihuilist).intersection(set(anewlist)))
        aanewlist = list(set(anewlist).difference(set(system_intersect_identifiers)))

        identifiers = list(set(classeslist).intersection(set(aanewlist)))
        newlist = list(set(aanewlist).difference(set(identifiers)))

        newlist.sort(key=lambda i: len(i), reverse=True)
        # newlist.sort(key=methodslist.index)
        trans_dict_to_xml_new(newlist, sicdir, "methods.txt")
        # dict = {}
        # for lstr in newlist:
        #     dict[lstr] = lstr
        # if dict:
        #     # print(dict)
        #     trans_dict_to_xml(dict,sicdir,"methods.txt")


def save(filename, contents):
    context = str(contents)
    with open(filename, 'a') as f:
        f.seek(0)
        f.truncate()
        f.write(context)
        f.close()
    # fh = open(filename, 'w', encoding='utf-8')
    # fh.write(context)
    # fh.close()
def trans_dict_to_xml_new(data_list,sicdir,file_name):
    #字典转换为xml字符串
    data_xml = []
    for k in data_list:  # 遍历字典排序后的key
        data_xml.append('<key>{key}</key>\n<string>{value}</string>'.format(key=k, value=k))
    xml = '\n'.join(data_xml)
    path = os.path.join(sicdir,file_name)
    save(path,xml)

def trans_dict_to_xml(data_dict,sicdir,file_name):
    #字典转换为xml字符串
    data_xml = []
    for k in data_dict.keys():  # 遍历字典排序后的key
        v = data_dict.get(k)  # 取出字典中key对应的value
        data_xml.append('<key>{key}</key>\n<string>{value}</string>'.format(key=k, value=v))
        # data_xml.append('<{key}>{value}</{key}>'.format(key=k, value=v))
    xml = '\n'.join(data_xml)
    # xml1 = '<xml>{}</xml>'.format(xml)
    # print(xml)
    path = os.path.join(sicdir,file_name)
    # if not os.path.exists(path):
    #     os.makedirs(path)
    save(path,xml)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(u'收集object-c工程中的类，属性，方法')
    parser.add_argument('-d', '--dir', help=u"目标目录",action="store", dest="dir", default="./")
    parser.add_argument('-o', '--out', help=u"输出目录",action="store", dest="out", default="./out")
    args = parser.parse_args()
    huoquPath(args.dir,args.out)
    print ("args.dir == " + str(args.dir))
    print ("args.out == " + str(args.out))
