# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-19 05:09
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SunChoi', '0002_auto_20170819_0507'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cliente',
            name='dni',
            field=models.CharField(max_length=13, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='dni',
            field=models.CharField(max_length=13, primary_key=True, serialize=False),
        ),
    ]