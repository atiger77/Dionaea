# -*- coding:utf-8 -*-
from django.shortcuts import render, render_to_response
from django.template import RequestContext


def login(request):
    if request.method == 'POST':
        username = request.POST['username'].strip()
        password = request.POST['password'].strip()
        return render(request,"index.html", {})
        # return render_to_response("index.html")
    else:
        # return render_to_response("index.html")
        # return render_to_response("index.html", {}, context_instance=RequestContext(request))
        return render(request, "index.html", {})
