from flask_restful import Api
from APPS.Account.api import RegisterApi, ActiveApi, LoginApi, LogoutApi
from APPS.comments.api import CommentsApi
from APPS.posts.api import PostsApi

api = Api()


def init_api(app):
    api.init_app(app)


# 注册路由系统

api.add_resource(PostsApi, "/posts")

api.add_resource(CommentsApi, "/comments")

api.add_resource(RegisterApi, "/register/",endpoint='register')
api.add_resource(ActiveApi, "/active/", endpoint='active')
api.add_resource(LoginApi, "/login/",endpoint='login')
api.add_resource(LogoutApi, "/logout/")

