import datetime
import os
from flask_mail import Mail
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_uploads import UploadSet, IMAGES, configure_uploads, patch_request_class
from  flask_login import LoginManager




db = SQLAlchemy()
migrate = Migrate()


# 配置数据库的参数
def config_db(app):

    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@127.0.0.1:3306/blog_db1'

    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    # 设置请求结束之后自动提交
    app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True


# 配置数据库连接
def init_db(app):
    config_db(app)
    db.init_app(app=app)
    migrate.init_app(app, db)


mail = Mail()


def init_mail(app):
    mail.init_app(app)



"""文件上传相关配置"""
# 获取当前文件所在的根目录
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
# 获取项目上传文件的目录
UPLOAD_PATH = os.path.join(BASE_DIR, 'static/upload/')
images = UploadSet('images', extensions=IMAGES)


def init_uploads_config(app):
    # 文件上传的路径
    app.config['UPLOADS_DEFAULT_DEST'] = UPLOAD_PATH
    # 生成图片地址的url地址 默认 http://127.0.0.1:8000/_uploads/
    app.config['UPLOADS_DEFAULT_URL'] = 'http://127.0.0.1:8000/static/upload/'
    # 默认文件上传类型 DEFAULTS = TEXT + DOCUMENTS + IMAGES + DATA
    configure_uploads(app, images)
    # 文件上传的最大长度 默认64m
    patch_request_class(app, 16 * 1024 * 1024)


def get_file_name(old_name):
    # .png .jpg
    # 获取客服端图片的后缀名
    suffix_name = '.' + old_name.split('.')[-1]
    # 把时间类型转化指定格式的字符串输出
    # IMG20180503161930
    new_name = 'IMG_%s' % (datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
    return new_name + suffix_name
