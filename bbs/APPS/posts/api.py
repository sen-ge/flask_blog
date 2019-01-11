from flask_restful import Resource, fields, marshal_with, reqparse
from flask import make_response

from APPS.Account.models import *

post_fields = {
    'post_id': fields.Integer,
    'post_classify_id': fields.Integer,
    'post_name': fields.String,
    'poster': fields.String,
    'post_content': fields.String,
    'create_time': fields.DateTime,
    'click_rate': fields.Integer,
    'is_delete': fields.String,
}
result = {
    'status': fields.Integer(),
    'msg': fields.String,
    'data': fields.List(fields.Nested(post_fields)),
}


class PostsApi(Resource):
    @marshal_with(result)
    def get(self):
        posts = Posts.query.all()
        return {'status': 200, "msg": "success", "data": posts}
