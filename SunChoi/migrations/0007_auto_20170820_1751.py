# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-20 17:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SunChoi', '0006_auto_20170820_1743'),
    ]

    operations = [
        migrations.AlterField(
            model_name='proveedores',
            name='email',
            field=models.EmailField(max_length=200, null=True),
        ),
    ]
