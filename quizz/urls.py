# -*- coding: utf-8 -*-

from django.urls import path

from . import views

app_name = 'quizz'
urlpatterns = [
    path('theme', views.theme, name='theme'),
    path('<int:theme_id>', views.question, name='question'),
    path('loginuser', views.loginuser, name='loginuser'),
    path('newuser', views.newuser, name='newuser'),   
    path('question', views.question, name='question')
]