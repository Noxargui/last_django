from django.http import HttpResponse
# from django.template import loader
from django.shortcuts import get_object_or_404, render, redirect
from .models import Theme, Question#, Choice
from django.http import Http404
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib import admin
from django.urls import path


def theme(request):
    latest_theme_list = Theme.objects.order_by('id')[:5]
    # template = loader.get_template('quizz/index.html')
    context = {
        'latest_theme_list': latest_theme_list,
    }
    # return HttpResponse(template.render(context, request))
    return render(request, 'quizz/theme.html', context)

def question(request, theme_id):
    #context = {"choice_list":0, "question_list":0}
    #choice_list = []
    question_list = Question.objects.filter(theme=theme_id)
    context = {"question_list" : question_list}
    #for question in question_list:
    #    choice_list.append(Choice.objects.filter(question=question.id))
    #    #context['choice_list']=Choice.objects.filter(question=question.id)
    #    context[f"{question.id}"] = choice_list[-1]
    
    #choice_list = Choice.objects.filter(question=question_id)
    #context = {
     #   'question_list': question_list,
        #'choice_list': choice_list,
    #}
    return render(request, 'quizz/question.html', context)

#def choice(request, question_id):
#    #question_list = Question.objects.filter(theme=theme_id)
#    choice_list = Choice.objects.filter(question=question_id)
#    context = {
#        #'question_list': question_list,
#        'choice_list': choice_list,
#    }
#    return render(request, 'quizz/choice.html', context)

def home(request):
	#quizzs = Quizz.objects.all()
#	next = request.POST.get('next', '/')
	if request.method == 'POST':	
		print(request.POST.get("next", "eeee"))	
		request.session['test'] = request.POST.get("next")	
		request.session.get('test')
		#return redirect('animaux')	
	return render(request, 'quizz/home.html')

def admin(request):
    return render(request, 'quizz/admin.html')

from django.contrib.auth import authenticate, login

def triche(request):
    return render(request, 'quizz/loginuser.html')	

def loginuser(request):
    
    username = request.POST.get('username')
    password = request.POST.get('password')
    user = authenticate(username=username, password=password)

    #context = {"link" : "http://127.0.0.1:8000/admin"}

    #context = {"username" : username, "password":password}
    if username == "admin" and password == "password":
        context = {"link" : "http://127.0.0.1:8000/admin"}    
    else:
        context = {"link" : "erreur"}
        #return render(request, 'quizz/admin.html')

        
    return render(request, 'quizz/loginuser.html',context)	


from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.http import *
import http
from django.views.generic import TemplateView
from django.conf import settings

#class LoginView(TemplateView):
#
#  template_name = 'quizz/loginuser.html'

#def LoginView(request):
#
#    username = request.POST.get('username')
#    password = request.POST.get('password')
#    user = authenticate(username=username, password=password)
#    if username == "admin" and password == "password":
#        return render(request, 'admin')
#    #if user is not None and user.is_active:
#    #    #login(request, user)
#    #    return render(request, 'quizz/admin.html')
#        #return HttpResponseRedirect( settings.LOGIN_REDIRECT_URL )
        #return HttpResponseRedirect('/admin')
    #return render(request, self.template_name)


#class LogoutView(TemplateView):
#
#  template_name = 'quizz/loginuser.html'
#
#  def get(self, request, **kwargs):
#
#    logout(request)
#
#    return render(request, self.template_name)