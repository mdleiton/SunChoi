# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-20 17:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SunChoi', '0005_auto_20170820_1550'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proveedores',
            name='email',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
