# -*- coding:utf-8 -*-
from django.shortcuts import render, render_to_response
from django.template import RequestContext
from django.http.response import HttpResponse, JsonResponse


def login(request):
    if request.method == 'POST':
        username = request.POST['username'].strip()
        password = request.POST['password'].strip()
        return JsonResponse({"message": u"用户名和密码错误"})
    else:
        return render_to_response("index.html", {}, context_instance=RequestContext(request))
