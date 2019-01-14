# -*- coding: UTF-8 -*-

from django.shortcuts import render, HttpResponseRedirect
from dal import autocomplete
from .models import Director, Orientacion


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

