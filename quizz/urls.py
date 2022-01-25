# -*- coding: utf-8 -*-

from django.urls import path

from . import views

app_name = 'quizz'
urlpatterns = [
    
    #path('loginuser', views.LoginView.as_view(), name='LoginView'),
    path('theme', views.theme, name='theme'),
    path('<int:theme_id>', views.question, name='question'),
    path('loginuser', views.loginuser, name='loginuser'),
    #path('LoginView', views.LoginView, name='LoginView'),
    
    
]

#from django.conf.urls import patterns, include, url
#from rest_framework import routers
#from eboutique.views import *
#from erp.views import *
#from django.contrib.auth.decorators import login_required
#
#urlpatterns = patterns('',
#    url(r'^$', LoginView.as_view()),
#    url(r'^logout/$', LogoutView.as_view()),
#    url(r'^backoffice/$', login_required(TemplateView.as_view(template_name='backoffice/index.html'))),
#)