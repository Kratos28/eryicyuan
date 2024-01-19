#coding=utf-8
import os
import sys
import json 

def cur_file_dir():
   path = sys.path[0]
   if os.path.isdir(path):
        return path
   elif os.path.isfile(path):
        return os.path.dirname(path)

file_json = open(cur_file_dir() + "/buildCodeCof/config.json", "r") #打开JSON的配置表
data_json = json.loads(file_json.read()) #读取配置表中的数据

root = str(data_json["super"]) #获取父类的前缀
controller = str(data_json["controller"]) #获取控制器的前缀名

presenter_h = ''
presenter_m = ''
for operation in data_json["presenter"]:
   presenter_h += '\n- (void)' + str(operation) + ';'
   presenter_m += '- (void)' + str(operation) + ' {\n\n}\n\n'

view_model_h = ''
view_model_m = ''
for request in data_json["viewModel"]:
   #遍历获取数据的方法
   view_model_h += '- (void)' + str(request) + 'WithParameter:(NSDictionary *)parameter finishedCallBack:(void (^)())finishCallBack;\n' #进行OC版本的字符串拼接
   view_model_m += '\n- (void)' + str(request) + \
       'WithParameter:(NSDictionary *)parameter finishedCallBack:(void (^)())finishCallBack {\n\n}\n'

model = ''
for key in data_json["model"]:
   #遍历数据模型
   type = ''
   modified = ''
   value = data_json["model"][key]
   if value == 'String':
      type = 'NSString * '
      modified = 'copy'
   elif value == 'Int':
         type = 'NSInteger '
         modified = 'assign'
   elif value == 'Float':
         type = 'CGFloat '
         modified = 'assign'
   elif value == 'Bool':
         type = 'BOOL '
         modified = 'assign'
   elif value == 'Array':
         type = 'NSArray * '
         modified = 'strong'
   elif value == 'Dictionary':
         type = 'NSDictionary * '
         modified = 'strong'
   else:
         type = value
         modified = 'strong'
   model += '\n@property (nonatomic,' + modified + ') ' + type + str(key) + ';' #拼接数据的属性

file_json.close() #关闭JSON文件

os.path.join(cur_file_dir(), controller) #进行文件夹之间的关联
folderController = cur_file_dir() + "/" + controller
isExists = os.path.exists(folderController)
if not isExists:
      os.makedirs(folderController)  # 创建关联文件夹

def builder(path, file): #获取模板生成的封装
   r = open(cur_file_dir() + '/buildCodeCof/Template/' + path, 'r') #打开模板文件
   d = r.read() #读模板文件的数据
   r.close() #关闭模板文件
   w = open(cur_file_dir() + '/' + controller + '/' + controller + file, 'w') #创建目标文件
   w.write(d.replace('<#Unit#>', controller).replace('<#unit#>', controller.lower()).replace('<#Root#>', root).replace('<#ViewOperation#>', presenter_h).replace('<#ViewOperation_m#>', presenter_m).replace('<#ModelInterface#>', model).replace('<#ViewModelInterface#>', view_model_h).replace('<#ViewModelImplementation#>', view_model_m)) #进行写入文件
   w.close() #关闭文件

builder('InterfaceTemplate.h', 'Interface.h')
builder('ControllerTemplate.h', 'ViewController.h')
builder('ControllerTemplate.m', 'ViewController.m')
builder('ModelTemplate.h', 'Model.h')
builder('ModelTemplate.m', 'Model.m')
builder('PresenterTemplate.h', 'Presenter.h')
builder('PresenterTemplate.m', 'Presenter.m')
builder('ViewModelTemplate.h', 'ViewModel.h')
builder('ViewModelTemplate.m', 'ViewModel.m')
builder('ViewTemplate.h', 'View.h')
builder('ViewTemplate.m', 'View.m')
