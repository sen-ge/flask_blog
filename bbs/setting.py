import datetime


class Config:
    DEBUG = True
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    # 秘钥
    SECRET_KEY = '21039c08cac511e882c5001c42de2dd9'
    # session使用redis缓存
    SESSION_TYPE = 'redis'
    # 配置session的过期时间 默认浏览器关闭就失效
    PERMANENT_SESSION_LIFETIME = datetime.timedelta(days=7)
    MAIL_DEBUG = True
    # smtp.163.com
    MAIL_SERVER = 'smtp.qq.com'
    MAIL_PORT = 25
    # 163邮箱的时候不要使用ssl加密
    # MAIL_USE_SSL = True
    MAIL_USE_TLS = False
    # MAIL_USE_SSL = True
    MAIL_USERNAME = '1679228792@qq.com'
    MAIL_PASSWORD = 'mtmmiyaakhbuejee'
    # vcmthitdmolibcba
    # MAIL_DEFAULT_SENDER = '8614068889@163.com'

    # 异步任务配置
    REDIS_URL = 'redis://127.0.0.1:6379'
    CELERY_BROKER_URL = 'redis://127.0.0.1:6379/0'
    CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379/0'
