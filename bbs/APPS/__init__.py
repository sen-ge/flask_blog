from flask import Flask
from APPS.Account.views import classify

from APPS.Detail.views import post

from APPS.ext import init_db, init_mail, init_uploads_config
from APPS.urls import init_api
from flask_cors import *
from setting import Config


def create_app():


    app = Flask(__name__, template_folder='templates', root_path='E:\\groupDemo\\bbs',static_folder='static')



    CORS(app, supports_credentials=True)
    app.config.from_object(Config)
    app.debug = True
    init_api(app)
    init_db(app)
    init_blue(app)
    init_mail(app)
    init_uploads_config(app)
    return app


def init_blue(app):
    app.register_blueprint(classify)

    app.register_blueprint(post)
