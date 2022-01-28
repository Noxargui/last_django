from django.contrib import admin

from .models import New_Question, Theme, Question, Choice, Comment, Score

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 1

class QuestionInline(admin.StackedInline):
    model = Question
    extra = 1

class ThemeAdmin(admin.ModelAdmin):
    # fieldsets = [
    #     (None,               {'fields': ['theme_text']}),
    #     #('Date information', {'fields': ['pub_date']}),
    # ]
    inlines = [QuestionInline]
    
class QuestionAdmin(admin.ModelAdmin):
    #fieldsets = [
    #     (None,               {'fields': ['question_text']})
    #     #('Date information', {'fields': ['pub_date']}),
    #]
    inlines = [ChoiceInline]
    

admin.site.register(Theme)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Comment) 
admin.site.register(New_Question) 
admin.site.register(Score) 
#admin.site.register(Choice)