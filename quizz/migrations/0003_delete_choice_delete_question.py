# Generated by Django 4.0.1 on 2022-01-21 15:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('quizz', '0002_remove_choice_question_remove_question_theme'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Choice',
        ),
        migrations.DeleteModel(
            name='Question',
        ),
    ]
