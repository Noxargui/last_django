from random import choice
from django.http import HttpResponse
# from django.template import loader
from django.shortcuts import get_object_or_404, render, redirect
from .models import Theme, Question, Choice
from django.http import Http404
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout, authenticate
from django.contrib import admin
from django.urls import path
from django.contrib.auth.models import User


def theme(request):
    latest_theme_list = Theme.objects.order_by('id')[:5]
    # template = loader.get_template('quizz/index.html')
    context = {
        'latest_theme_list': latest_theme_list,
    }
    # return HttpResponse(template.render(context, request))
    return render(request, 'quizz/theme.html', context)

def question(request, theme_id):

    question_list = Question.objects.filter(theme=theme_id)
    context = {
        'theme_id': theme_id,
        'question_list': question_list,
    }
    if request.method == 'GET':
        return render(request, 'quizz/question.html', context)
    if request.method == 'POST':
        # Selectionner tous les choix et les mettre en déselectionné
        nb_question = len(Question.objects.filter(theme=theme_id))
        for choice in Choice.objects.filter(theme=theme_id):
            choice.selected = False
            choice.save()

        score = 0

        # Liste de tous les choix sélectionnés
        list_selected_choice = []
        for question_id in range(1,nb_question+1):
            if request.POST.get(f'choice_id{question_id}'):
                list_selected_choice.append(request.POST.get(f'choice_id{question_id}'))
        
        for choice_id in list_selected_choice:
            choice_selected = Choice.objects.get(pk=choice_id)
            choice_selected.selected = True
            choice_selected.save()

        context["choice_selected"]=choice_selected
        
        for choice in Choice.objects.filter(theme=theme_id):
            if choice.selected == True and choice.votes == True:
                score += 1
        score = str(score) + "/" + str(nb_question)
        context["score"]=score

        return render(request, 'quizz/results.html', context)

def results(request, theme_id):
    question_list = Question.objects.filter(theme=theme_id)
    context = {
        'question_list': question_list,
        'theme_id': theme_id
    }

    return render(request, 'quizz/results.html', context)

#def choice(request, question_id):
#    #question_list = Question.objects.filter(theme=theme_id)
#    choice_list = Choice.objects.filter(question=question_id)
#    context = {
#        #'question_list': question_list,
#        'choice_list': choice_list,
#    }
#    return render(request, 'quizz/choice.html', context)

def home(request):
	return render(request, 'quizz/home.html')


from django.contrib.auth import authenticate, login


def newuser(request):
    if request.method == 'GET':
        return render(request, 'quizz/newuser.html')
    if request.method == 'POST':
        new_username = request.POST.get('new_username')
        new_password = request.POST.get('new_password')
        user = User.objects.create_user(new_username, '', new_password)
        user.save()
        return redirect('/quizz/loginuser')

def loginuser(request):
    if request.method == "GET":
        return render(request, 'quizz/loginuser.html')
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)

        if user is not None:
            if user.is_superuser:
                return redirect('/admin')  
            else:
                return redirect('/quizz/theme')
        else:
            return render(request, 'quizz/loginuser.html', {"error": "Cet utilisateur n'éxiste pas"}) 

def score(request):
    return render(request, 'quizz/score.html')

    