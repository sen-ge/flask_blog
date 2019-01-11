from flask import Blueprint, request, render_template

from APPS.Account.models import Posts, User, Classify

post=Blueprint('Detail',__name__)

@post.route('/detail/')
def det():
    pid = request.args['p_id']
    details = Posts.query.filter(Posts.post_id == pid).first()
    user=User.query.filter(User.u_id==details.poster).first()
    classify=Classify.query.filter(Classify.classify_id==details.post_classify_id).first()
    return render_template('info.html',details=details,user=user,classify=classify)