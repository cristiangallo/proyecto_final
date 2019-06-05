# -*- coding: UTF-8 -*-

from django.shortcuts import render, HttpResponseRedirect
from dal import autocomplete
from .models import Director, Orientacion


def download_csv_data(request):
    from proyecto.models import Proyecto
    from django.http import HttpResponse
    import csv
    from django.utils.encoding import smart_str

    response = HttpResponse(content_type='text/csv')

    response['Content-Disposition'] = 'attachment; filename="proyectos.csv"'

    '''
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
    '''

    writer = csv.writer(response, csv.excel)
    response.write(u'\ufeff'.encode('utf8'))

    # write the headers
    writer.writerow([
        smart_str(u"Título"),
        smart_str(u"Director"),
        smart_str(u"Co-Director"),
        smart_str(u"Asesor"),
        smart_str(u"Orientación"),
        smart_str(u"Plan"),
        smart_str(u"fecha_inscripcion"),
        smart_str(u"fecha_anteproyecto"),
        smart_str(u"fecha_final"),
        smart_str(u"Anteproyecto"),
        smart_str(u"Modificado"),
        smart_str(u"creado"),
    ])

    #get data from database or from text file....
    proyectos = Proyecto.objects.all()
    for proyecto in proyectos:
        writer.writerow([
            smart_str(proyecto.titulo),
            smart_str(proyecto.director),
            smart_str(proyecto.co_director),
            smart_str(proyecto.asesor),
            smart_str(proyecto.orientacion),
            smart_str(proyecto.plan),
            smart_str(proyecto.fecha_inscripcion),
            smart_str(proyecto.fecha_anteproyecto),
            smart_str(proyecto.fecha_final),
            smart_str(proyecto.anteproyecto),
            smart_str(proyecto.modificado),
            smart_str(proyecto.creado),
        ])
    return response


def upload_alumnos(request):
    from .forms import UploadContactosForm

    if request.method == 'POST':
        form = UploadContactosForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(request.META['HTTP_REFERER'])
    else:
        form = UploadContactosForm()

    return render(request, "admin/proyecto/alumno/upload_alumnos.html", {'form': form})


class DirectorAutocomplete(autocomplete.Select2QuerySetView):

    def get_queryset(self):
        from django.utils.encoding import smart_text
        from functools import reduce
        from django.db.models.query import QuerySet
        import operator
        from django.db import models

        if not self.request.user.is_authenticated():
            return Director.objects.none()

        qs = Director.objects.all()

        if self.q:
            search_fields = ("id__iexact", "nombre__icontains", "apellido__icontains")
            for word in self.q.split():
                search = [models.Q(**{smart_text(item): smart_text(word)}) for item in search_fields]
                search_qs = QuerySet(Director)
                search_qs.query.select_related = qs.query.select_related
                search_qs = search_qs.filter(reduce(operator.or_, search))
                qs &= search_qs

        return qs


class OrientacionAutocomplete(autocomplete.Select2QuerySetView):

    def get_queryset(self):
        if not self.request.user.is_authenticated():
            return Orientacion.objects.none()

        qs = Orientacion.objects.all()

        if self.q:
            qs = qs.filter(descripcion__icontains=self.q)

        return qs

