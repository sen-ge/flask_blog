from operator import or_
from flask import render_template, session
from flask_mail import Message
from flask_restful import Resource, reqparse
# <<<<<<< HEAD
# from APPS.Account.models import User, user_to_user, UserNext
# =======
from APPS.Account.models import *
# >>>>>>> e202e7ccbbd97e8cf71abe322444e419554d3cc8
from APPS.ext import db, mail
from APPS.result import Result
from setting import Config


class RegisterApi(Resource):
    def __init__(self):
        self.parser = reqparse.RequestParser()
        self.parser.add_argument('username', type=str, required=True)
        self.parser.add_argument('password', type=str, required=True)
        self.parser.add_argument('confirm_password', type=str, required=True)
        self.parser.add_argument('email', type=str, required=True)

    # 实现注册功能
    def post(self):
        args = self.parser.parse_args()
        username = args.get('username')
        password = args.get('password')
        confirm_password = args.get('confirm_password')
        email = args.get('email')
        # 判断信息是否填写完整
        if username and password and confirm_password and email:
            # 判断邮箱或者用户名是否已经被注册
            if User.query.filter(or_(User.username == username, User.email == email)).all():
                return Result.get_error_result(msg='用户名已存在或者邮箱已被注册')
            if password != confirm_password:
                return Result.get_error_result(msg='两次输入密码不一致')
            user = User()
            user.username = username
            user.email = email
            user.password = password
            db.session.add(user)
            db.session.commit()
            # 发送邮件
            send_email(username, email, user.u_id)
            return Result.get_sucess_result_obj(msg='注册成功')
        else:
            return Result.get_error_result(msg='信息不能为空')


class ActiveApi(Resource):
    def __init__(self):
        self.parser = reqparse.RequestParser()
        self.parser.add_argument('uid', type=int, required=True)

    def get(self):
        uid = self.parser.parse_args().get('uid')
        User.query.filter(User.u_id == uid).update({User.is_active: 1})
        db.session.commit()
        return Result.get_sucess_result_obj(msg='激活成功')


class LoginApi(Resource):
    def __init__(self):
        self.parser = reqparse.RequestParser()
        self.parser.add_argument('username', type=str, required=True)
        self.parser.add_argument('password', type=str, required=True)

    def post(self):
        args = self.parser.parse_args()
        username = args.get('username')
        password = args.get('password')
        # 得到的是一个列表
        user_list = User.query.filter(User.username == username).all()

        u_id=user_list[0].u_id

        a = UserNext.query.filter(UserNext.un_id == u_id).first()
        count=a.user
        b = User.query.filter(User.u_id == u_id).first()
        is_count = b.usern

        user_count=len(count)
        user_is_count=len(is_count)
        # 用户名不存在，得到空列表
        if not user_list:
            return Result.get_error_result(msg='用户名不存在')
        # 得到user对象
        user = user_list[0]
        if not user.is_active:
            return Result.get_error_result(msg='该帐号未激活')
        if user.is_delete:
            return Result.get_error_result(msg='该帐号禁止登录,请与管理员联系')
        if user.password != password:
            return Result.get_error_result(msg='密码输入错误')
        # 记住登录状态
        session['username'] = username

        session['u_id']=u_id
        session['user_count']=user_count
        session['user_is_count']=user_is_count

        return Result.get_sucess_result_obj(msg='登录成功')


class LogoutApi(Resource):
    def get(self):
        # 判断用户是否登录
        if session['username']:
            # 删除session
            session.pop('username')
            return Result.get_sucess_result_obj(msg='注销成功')
        else:
            return Result.get_error_result(msg='用户未登录')


def send_email(username, email, uid):
    html = render_template('mail.html', username=username, uid=uid)
    msg = Message(subject='欢迎使用我们的系统-邮件激活', html=html, sender=Config.MAIL_USERNAME,
                  recipients=[email])
    mail.send(msg)

