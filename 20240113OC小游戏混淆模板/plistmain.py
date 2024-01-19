#!/usr/bin/env python
# coding=utf-8
import sys
import argparse
import stat
import plistreplace

if __name__ == "__main__":

    parser = argparse.ArgumentParser(u"IOS 字符串代码替换 工具")
    parser.add_argument('-po', '--plistout', help=u"plist输出路径",
                    action="store", dest="outplistdir", default="../outplist")
    parser.add_argument('-p', '--plist', nargs='*',help=u"plist文件", action="store", dest="plist", default="confimg64.plist")
    parser.add_argument('-d', '--dir', help=u"目标目录", action="store", dest="dir", default="../")                 
    parser.add_argument('-o', '--out', help=u"输出目录", action="store", dest="out", default="../out")
    args = parser.parse_args()

    plistreplace.main(args.plist, args.outplistdir, args.dir, args.out)
    print u'完成替换'
