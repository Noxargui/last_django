from django.contrib import admin

from .models import Theme, Question#, Choice

#class ChoiceInline(admin.TabularInline):
#    model = Choice
#    extra = 4

class QuestionInline(admin.StackedInline):
    model = Question
    extra = 4

class ThemeAdmin(admin.ModelAdmin):
    # fieldsets = [
    #     (None,               {'fields': ['theme_text']}),
    #     #('Date information', {'fields': ['pub_date']}),
    # ]
    inlines = [QuestionInline]
    
#class QuestionAdmin(admin.ModelAdmin):
     #fieldsets = [
      #   (None,               {'fields': ['question']}),
    #     #('Date information', {'fields': ['pub_date']}),
     #]
    #inlines = [QuestionInline]
    

admin.site.register(Theme, ThemeAdmin)
admin.site.register(Question)#, QuestionAdmin)
#admin.site.register(Choice)