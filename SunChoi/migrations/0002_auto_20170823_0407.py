# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-23 04:07
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SunChoi', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ordencompra',
            name='fecha',
            field=models.DateTimeField(default=datetime.datetime(2017, 8, 23, 4, 7, 3, 367693)),
        ),
    ]
