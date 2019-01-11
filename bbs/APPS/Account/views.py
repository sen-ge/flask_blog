from flask import Blueprint, render_template, request

from APPS.Account.models import Classify, Posts, User, user_to_user

classify = Blueprint('Accoount', __name__, template_folder='templates')


@classify.route('/')
def cla():
    try:
        cid = request.args['c_id']
        classifys = Classify.query.filter(Classify.classify_id == cid).all()
        posts = Posts.query.filter(Posts.post_classify_id == cid).all()
        for i in posts:
            a = i.poster
            user = User.query.filter(User.u_id == a).all()
            i.username = user
        return render_template('classify.html', classifys=classifys, posts=posts)
    except Exception as e:
        try:

            u_id=request.args['u_id']
            posts = Posts.query.filter(Posts.poster == u_id).all()
            return render_template('MyPost.html', posts=posts)


        except Exception as e:

            try:
                classifys=Classify.query.all()
                for i in classifys:
                    a=i.classify_id
                    articles=Posts.query.filter(Posts.post_classify_id==a).all()
                    articles=articles[0:6]
                    i.art_name=articles
            except Exception as e:
                print(e)
            return render_template('index.html',classifys=classifys)


@classify.route('/login/')
def login():
    return render_template('login.html')


@classify.route('/register/')
def register():
    return render_template('register.html')
