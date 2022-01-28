from django.db import models
import datetime
from django.utils import timezone

class Theme(models.Model):
    theme_text = models.CharField(max_length=200)
    #pub_date = models.DateTimeField('date published')
    def __str__(self):
        return self.theme_text
    #def was_published_recently(self):
    #    return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
    
class Question(models.Model):
    theme = models.ForeignKey(Theme, on_delete=models.CASCADE)
    question_text = models.CharField(max_length=200)
    def __str__(self):
        return self.question_text
#    def was_published_recently(self):
#        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
#    
class Choice(models.Model):
    theme = models.ForeignKey(Theme, on_delete=models.CASCADE)
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    def __str__(self):
        return self.choice_text

class Comment(models.Model):
    remark = models.CharField(max_length=200)
    question = models.CharField(max_length=200)
    def __str__(self):
        return self.remark