# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.db import models
from datetime import date


class Orientacion(models.Model):
    descripcion = models.CharField(max_length=255)

    def __str__(self):
        return u'%s' % self.descripcion

    class Meta:
        verbose_name_plural = u"Orientacion - Rama"


class Alumno(models.Model):
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)
    legajo = models.CharField(max_length=25, null=True, blank=True)
    email = models.EmailField(null=True, blank=True)
    orientacion = models.ForeignKey(Orientacion, null=True, blank=True)

    def __str__(self):
        return u'%s %s' % (self.apellido, self.nombre)

    class Meta:
        verbose_name_plural = u"Alumnos"


class Director(models.Model):
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)
    externo = models.BooleanField(default=False)

    def __str__(self):
        return u'%s %s' % (self.apellido, self.nombre)

    class Meta:
        verbose_name_plural = u"Directores"


class Plan(models.Model):
    nombre = models.CharField(max_length=255)

    def __str__(self):
        return u'%s' % self.nombre

    class Meta:
        verbose_name_plural = u"Planes"


def pdf_path_and_rename(instance, filename):
    import os
    from uuid import uuid4
    upload_to = 'pdf/%s' % date.today().strftime("%Y/%m/%d")
    ext = filename.split('.')[-1]
    filename = '{}.{}'.format(uuid4().hex, ext)
    return os.path.join(upload_to, filename)


class Proyecto(models.Model):
    titulo = models.CharField(max_length=255)
    alumnos = models.ManyToManyField(Alumno)
    director = models.ForeignKey(Director, on_delete=models.PROTECT)
    co_director = models.ForeignKey(Director, related_name="co_director", null=True, blank=True, on_delete=models.PROTECT)
    asesor = models.ForeignKey(Director, related_name="asesor", null=True, blank=True, on_delete=models.PROTECT)
    orientacion = models.ForeignKey(Orientacion, on_delete=models.PROTECT)
    plan = models.ForeignKey(Plan, null=True, blank=True)
    fecha_inscripcion = models.DateField()
    fecha_anteproyecto = models.DateField(null=True, blank=True)
    fecha_final = models.DateField(null=True, blank=True)
    anteproyecto = models.FileField(upload_to=pdf_path_and_rename, null=True, blank=True)
    creado = models.DateTimeField(auto_now_add=True, editable=False)
    modificado = models.DateTimeField(auto_now=True, editable=False)

    def __str__(self):
        return u'%s - %s' % (self.titulo, self.director)

    def lista_alumnos(self):
        lista = ""
        for alumno in self.alumnos.all():
            lista += "%s<br> " %alumno
        return lista
    lista_alumnos.short_description = 'Alumnos'
    lista_alumnos.allow_tags = True

    def cantidad_alumnos(self):
        return len(self.alumnos.all())
    cantidad_alumnos.short_description = 'Cantidad Alumnos'
    cantidad_alumnos.allow_tags = True

    def alumnos_csv(self):
        lista = ""
        for alumno in self.alumnos.all():
            lista += "%s-" %alumno

        lista = lista[:-1]
        return lista

    def anteproyecto_url(self):
        try:
            return '<a href="/media/%s" target="_blank">%s<a/>' % (self.anteproyecto, self.anteproyecto)
        except:
            pass
    anteproyecto_url.short_description = 'Anteproyecto PFD'
    anteproyecto_url.allow_tags = True



