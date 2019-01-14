# -*- coding: UTF-8 -*-

from __future__ import unicode_literals
from django.contrib import admin
from proyecto.models import Proyecto, Director, Alumno, Orientacion, Plan
from datetime import datetime


@admin.register(Alumno)
class AlumnoAdmin(admin.ModelAdmin):
    from .forms import AlumnoForm

    form = AlumnoForm

    list_display = 'nombre', 'apellido', 'email', 'orientacion'
    search_fields = 'nombre', 'apellido'
    list_filter = 'orientacion',


@admin.register(Director)
class DirectorAdmin(admin.ModelAdmin):
    pass


@admin.register(Plan)
class PlanAdmin(admin.ModelAdmin):
    pass


@admin.register(Orientacion)
class OrientacionAdmin(admin.ModelAdmin):
    pass


def exportar_pdf(self, request, queryset):
    from django.http import HttpResponse
    from .pdf import generate_pdf
    from django.template import Context

    try:
        args = {'results': queryset}

        resp = HttpResponse(content_type='application/pdf')
        resp['Content-Disposition'] = 'attachment; filename=proyectos%s.pdf'\
                                     % datetime.now().strftime("%d_%m_%Y_%H_%M_%S")
        result = generate_pdf("admin/proyecto/proyecto/export_pdf.html", resp, Context(args))
        self.message_user(request, "Se genero correctamente el archivo")
    except Exception as a:
        self.message_user(request, "Se produjo un error generando el archivo - %s." % a)

    return result


exportar_pdf.short_description = 'Exportar PDF'


def exportar_csv(self, request, queryset):

    from django.http import HttpResponse
    from django.template import Context, loader
    from datetime import datetime

    try:
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="proyectos%s.csv"' \
                                           % datetime.now().strftime("%d_%m_%Y_%H_%M_%S")
        args = {'results': queryset}
        plantilla = loader.get_template('admin/proyecto/proyecto/export_csv.txt')
        resultado = plantilla.render(Context(args))
        response.write(resultado)
        self.message_user(request, "Se genero correctamente el archivo")
    except Exception as a:
        self.message_user(request, "Se produjo un error generando el archivo - %s." % a)

    return response


exportar_csv.short_description = 'Exportar CSV'


@admin.register(Proyecto)
class ProyectoAdmin(admin.ModelAdmin):
    from .forms import ProyectoForm

    form = ProyectoForm

    list_display = 'titulo', 'director','co_director', 'lista_alumnos','cantidad_alumnos', 'asesor', 'orientacion','plan', 'fecha_inscripcion', \
                   'fecha_anteproyecto', 'fecha_final', 'anteproyecto_url'
    search_fields = 'titulo', 'director__apellido', 'alumnos__apellido'

    list_filter = 'orientacion', 'director', 'fecha_inscripcion'

    '''
    raw_id_fields = 'director', 'asesor', 'orientacion',
    related_lookup_fields = {
        'fk': ['director', 'asesor', 'orientacion']
    }
    autocomplete_lookup_fields = {
        'fk': ['director', 'asesor', 'orientacion']
    }
    '''
    filter_horizontal = ('alumnos', )
    # change_list_filter_template = "admin/filter_listing.html"
    # change_list_template = "admin/proyecto/proyecto/change_list.html"

    actions = [exportar_pdf, exportar_csv]

    def get_actions(self, request):
        actions = super(ProyectoAdmin, self).get_actions(request)
        if 'delete_selected' in actions:
            del actions['delete_selected']
        return actions

    '''
    def changelist_view(self, request, extra_context=None):

        extra_context = extra_context or {}
        try:
            extra_context['fecha_inscripcion_gte'] = request.GET['fecha_inscripcion__gte']
        except:
            pass

        try:
            extra_context['fecha_inscripcion_lte'] = request.GET['fecha_inscripcion__lt']
        except:
            pass

        return super(ProyectoAdmin, self).changelist_view(request, extra_context)
    '''
