from django.contrib import admin

from .models import Theme, Question, Choice

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
#admin.site.register(Choice)