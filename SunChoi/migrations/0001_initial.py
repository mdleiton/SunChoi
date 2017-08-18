# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-18 06:39
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('dni', models.IntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=100)),
                ('apellidos', models.CharField(max_length=100)),
                ('direccion', models.CharField(max_length=200)),
                ('telefono', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Comprobantepago',
            fields=[
                ('id_comprobante_pago', models.AutoField(primary_key=True, serialize=False)),
                ('fecha', models.DateTimeField(default=django.utils.timezone.now)),
                ('valor_adeudado', models.FloatField()),
                ('valor_pagado', models.FloatField()),
                ('saldo_pendiente', models.FloatField()),
            ],
        ),
        migrations.CreateModel(
            name='Factura',
            fields=[
                ('id_factura', models.AutoField(primary_key=True, serialize=False)),
                ('numero', models.CharField(max_length=200)),
                ('estado', models.CharField(max_length=200)),
                ('fecha', models.DateTimeField(default=django.utils.timezone.now)),
                ('id_cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Cliente')),
            ],
        ),
        migrations.CreateModel(
            name='Facturalineas',
            fields=[
                ('id_factura_linea', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad', models.FloatField()),
                ('total_factura_linea', models.FloatField()),
                ('id_factura', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Factura')),
            ],
        ),
        migrations.CreateModel(
            name='OrdenCompra',
            fields=[
                ('id_orden_compra', models.AutoField(primary_key=True, serialize=False)),
                ('numero', models.CharField(max_length=200)),
                ('fecha', models.DateTimeField(default=django.utils.timezone.now)),
                ('estado', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Ordencompralineas',
            fields=[
                ('id_orden_compra_linea', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad', models.FloatField()),
                ('unidad', models.CharField(max_length=200)),
                ('total_orden_compra_linea', models.FloatField()),
                ('id_orden_compra', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.OrdenCompra')),
            ],
        ),
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('id_producto', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=200)),
                ('descripcion', models.CharField(max_length=200)),
                ('precio_unitario', models.FloatField()),
                ('medida', models.CharField(max_length=200)),
                ('stock', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Proforma',
            fields=[
                ('id_proforma', models.AutoField(primary_key=True, serialize=False)),
                ('fecha_emision', models.DateTimeField(default=django.utils.timezone.now)),
                ('fecha_caducidad', models.DateTimeField()),
                ('id_cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Cliente')),
            ],
        ),
        migrations.CreateModel(
            name='ProformaLineas',
            fields=[
                ('id_proforma_linea', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad', models.FloatField()),
                ('unidad', models.CharField(max_length=200)),
                ('total_proforma_linea', models.FloatField()),
                ('id_producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Producto')),
                ('id_proforma', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Proforma')),
            ],
        ),
        migrations.CreateModel(
            name='Proveedores',
            fields=[
                ('id_proveedor', models.AutoField(primary_key=True, serialize=False)),
                ('razon_social', models.CharField(max_length=200)),
                ('direccion', models.CharField(max_length=200)),
                ('telefono', models.IntegerField()),
                ('email', models.EmailField(max_length=200, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Roles',
            fields=[
                ('id_rol', models.AutoField(primary_key=True, serialize=False)),
                ('rol', models.CharField(max_length=200)),
                ('descripcion', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Solicitudesdiferido',
            fields=[
                ('id_solicitud_diferido', models.AutoField(primary_key=True, serialize=False)),
                ('fecha', models.DateTimeField(default=django.utils.timezone.now)),
                ('estado', models.CharField(max_length=200)),
                ('id_factura', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Factura')),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('dni', models.IntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=200)),
                ('apellido', models.CharField(max_length=200)),
                ('direccion', models.CharField(max_length=200)),
                ('telefono', models.CharField(max_length=200)),
                ('correo', models.EmailField(max_length=254)),
                ('usuario', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Usuariorol',
            fields=[
                ('id_usuario_rol', models.AutoField(primary_key=True, serialize=False)),
                ('id_rol', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Roles')),
                ('id_usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Usuario')),
            ],
        ),
        migrations.AddField(
            model_name='solicitudesdiferido',
            name='id_usuario_aprobacion',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Usuario'),
        ),
        migrations.AddField(
            model_name='solicitudesdiferido',
            name='id_usuario_solicitante',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Cliente'),
        ),
        migrations.AddField(
            model_name='proforma',
            name='id_usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Usuario'),
        ),
        migrations.AddField(
            model_name='producto',
            name='proveedor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Proveedores'),
        ),
        migrations.AddField(
            model_name='ordencompralineas',
            name='id_producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Producto'),
        ),
        migrations.AddField(
            model_name='ordencompra',
            name='id_proveedor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Proveedores'),
        ),
        migrations.AddField(
            model_name='ordencompra',
            name='id_usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Usuario'),
        ),
        migrations.AddField(
            model_name='facturalineas',
            name='id_producto',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Producto'),
        ),
        migrations.AddField(
            model_name='factura',
            name='id_usuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Usuario'),
        ),
        migrations.AddField(
            model_name='comprobantepago',
            name='id_factura',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='SunChoi.Factura'),
        ),
    ]
