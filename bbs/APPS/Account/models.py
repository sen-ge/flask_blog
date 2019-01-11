
from APPS.ext import db


class User(db.Model):
    u_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(64), unique=True)
    password = db.Column(db.String(64))
    email = db.Column(db.String(64))
    image = db.Column(db.String(64))
    is_delete = db.Column(db.Integer, default=0)
    is_active = db.Column(db.Integer, default=0)
    is_superuser = db.Column(db.Integer, default=0)
    __tablename__ = 'user'



user_to_user = db.Table('user_to_user',
                        # 字段u_id， 外键关联User表的u_id
                        db.Column('u_id', db.Integer, db.ForeignKey('user.u_id'), primary_key=True),
                        # 字段n_uid， 外键关联UserNext表的n_uid
                        db.Column('n_uid', db.Integer, db.ForeignKey('usernext.n_uid'), primary_key=True)
                        )


class UserNext(db.Model):
    un_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    n_uid = db.Column(db.Integer, nullable=False, unique=True)
    n_username = db.Column(db.String(64))
    user = db.relationship('User', secondary=user_to_user, backref='usern')
    # 与user表建立联系，backref表示可以通过user.usern方法回查usernext,secondary指定副表名称
    __tablename__ = 'usernext'


# 分类表
class Classify(db.Model):
    classify_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    classify_name = db.Column(db.String(64), unique=True)

    __tablename__ = 'classify'


# 帖子表
class Posts(db.Model):
    post_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    post_classify_id = db.Column(db.ForeignKey("classify.classify_id"))
    post_name = db.Column(db.String(64))
    poster = db.Column(db.ForeignKey("user.u_id"))
    post_content = db.Column(db.Text)
    create_time = db.Column(db.DateTime)
    click_rate = db.Column(db.Integer)
    is_delete = db.Column(db.Integer, default=0)

    __tablename__ = 'posts'


# 评论表
class Comments(db.Model):
    comment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    replyName = db.Column(db.String(64))
    beReplyName = db.Column(db.String(64))
    browse = db.Column(db.String(64), default="24K纯塑料iphone9splus")
    osname = db.Column(db.String(64), default="win,linux,mac")
    id = db.Column(db.ForeignKey("user.u_id"))
    post_id = db.Column(db.ForeignKey("posts.post_id"))
    content = db.Column(db.Text(1000))
    img = db.Column(db.String(255))
    time = db.Column(db.DateTime)
    address = db.Column(db.String(255))
    replyBody = db.Column(db.Text(1000),default=0)

    __tablename__ = 'comments'
