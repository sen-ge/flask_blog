from flask import request, render_template, Blueprint, session
from flask_restful import Resource, fields, marshal_with, reqparse

from APPS.Account.models import *

comment_fields = {
    'comment_id': fields.Integer(),
    'replyName': fields.String,
    'beReplyName': fields.String,
    'browse': fields.String,
    'osname': fields.String,
    'id': fields.Integer(),
    'post_id': fields.Integer(),
    'content': fields.String,
    'img': fields.String,
    'time': fields.DateTime,
    'address': fields.String,
    'replyBody': fields.Integer

}
result = {
    'status': fields.Integer(),
    'msg': fields.String,
    'data': fields.List(fields.Nested(comment_fields)),
}


class CommentsApi(Resource):
    def __init__(self):
        self.parser = reqparse.RequestParser()
        self.parser.add_argument('post_id')

    @marshal_with(result)
    def get(self):
        args = self.parser.parse_args()
        post_id = args.get('post_id')
        comments = Comments.query.filter(Comments.post_id == post_id).all()
        return {'status': 200, 'msg': "success", 'data': comments}

    def post(self):
        replyName = request.form.get('replyName')
        content = request.form.get('content')
        post_id = request.form.get('post_id')
        u_id = session['u_id']
        comments = Comments()
        comments.replyName = replyName
        comments.content = content
        comments.post_id = post_id
        comments.id = u_id
        db.session.add(comments)
        db.session.commit()
        return {'status': 200, 'msg': "success"}

