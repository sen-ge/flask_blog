from flask_migrate import MigrateCommand
from flask_script import Manager, Server
from APPS import create_app
from flask import request, render_template, jsonify
from APPS.ext import images, get_file_name

app = create_app()
manager = Manager(app)

manager.add_command('start', Server(port=8000))
manager.add_command('db', MigrateCommand)


@app.route('/upload/', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST' and 'images' in request.files:
        # 得到FileStore对象
        image = request.files['images']
        # save方法保存图片，返回文件名
        file_name = images.save(image, folder='', name=get_file_name(image.filename))
        # 生成访问的url路径
        url = images.url(file_name)
        return jsonify({'msg': 'success', 'status': 201, 'url': url})
    elif request.method == 'GET':
        return render_template('upload_img.html')


if __name__ == '__main__':
    manager.run()
