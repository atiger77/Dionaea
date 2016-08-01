# -*- coding:utf-8 -*-
from django.shortcuts import render, render_to_response
from django.template import RequestContext
from django.http.response import HttpResponse, JsonResponse
import logging


def login(request):
    if request.method == 'POST':
        username = request.POST['username'].strip()
        password = request.POST['password'].strip()
        logging.basicConfig(level=logging.DEBUG,
                            format='%(asctime)s  %(message)s',
                            datefmt='%a, %d %b %Y %H:%M:%S',
                            filename='Dionaea.log',
                            filemode='aw')
        logging.warning('Username:{0},Password:{1}'.format(username,password))
        return JsonResponse({"message": u"用户名和密码错误"})
    else:
        return render_to_response("index.html", {}, context_instance=RequestContext(request))
