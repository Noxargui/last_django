from django.http import HttpResponse
# from django.template import loader
from django.shortcuts import get_object_or_404, render
from .models import Theme, Question
from django.http import Http404


def index(request):
    latest_theme_list = Theme.objects.order_by('id')[:5]
    # template = loader.get_template('quizz/index.html')
    context = {
        'latest_theme_list': latest_theme_list,
    }
    # return HttpResponse(template.render(context, request))
    return render(request, 'quizz/index.html', context)

def detail(request, theme_id):
    question_list = Question.objects.filter(theme=theme_id)
    context = {
        'question_list': question_list,
    }
    return render(request, 'quizz/detail.html', context)