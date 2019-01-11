class Result:
    @staticmethod
    def get_sucess_result_obj(data=None, status=200, msg='success'):
        return {
            'status': status,
            'msg': msg,
            'data': data
        }

    @staticmethod
    def get_error_result(status=404, msg='error'):
        return {
            'status': status,
            'msg': msg
        }
