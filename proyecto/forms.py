# -*- coding: UTF-8 -*-

from django import forms
from dal import autocomplete
from .models import Director, Proyecto, Orientacion, Alumno


class UploadContactosForm(forms.Form):

    alumnos_csv = forms.FileField(help_text="recordá que el formato es csv, y el contenido debe ser 'id,apellido,nombre,legajo,mail,orientación'")

    def save(self):
        import re
        import csv

        file_alumnos_csv = '/tmp/alumnos.csv'
        alumnos_csv = self.cleaned_data['alumnos_csv']

        with open(file_alumnos_csv, 'wb+') as destino:
            for chunk in alumnos_csv.chunks():
                destino.write(chunk)

        with open(file_alumnos_csv, "r", encoding='iso-8859-1') as csv_file:
            for row in csv.reader(csv_file, delimiter=','):
                nombre = row[1]
                apellido = row[2]
                legajo = row[3]
                email = row[4]
                orientacion = row[5]

                '''
                match = re.match(r"^(?P<id>[0-9]+)[,;|][^\S\n\t]*(?P<apellido>[\w]+)[^\S\n\t]*[,;|][^\S\n\t]*(?P<nombre>[\w]+)[^\S\n\t]*[,;|](?P<legajo>[A-Z][-]\d{4,}[/]\d)[,;|](?P<email>[0-9a-zA-Z_\-@.]+)[,;|](?P<orientacion>[\w]+)$", ",".join(row))
                if match:
                    nombre = match.group("nombre")
                    apellido = match.group("apellido")
                    legajo = match.group("legajo")
                    email = match.group("email")
                    orientacion = match.group("orientacion")
                '''

                orientacion, creado = Orientacion.objects.get_or_create(descripcion=orientacion)

                alumno, creado = Alumno.objects.get_or_create(legajo=legajo, defaults={
                    'nombre': nombre, 'apellido': apellido, 'email': email, 'orientacion': orientacion
                })


class ProyectoForm(forms.ModelForm):
    director = forms.ModelChoiceField(queryset=Director.objects.all(), required=True,
                                      widget=autocomplete.ModelSelect2(url='director-autocomplete'))

    co_director = forms.ModelChoiceField(queryset=Director.objects.all(), required=False,
                                         widget=autocomplete.ModelSelect2(url='director-autocomplete'))

    asesor = forms.ModelChoiceField(queryset=Director.objects.all(), required=False,
                                    widget=autocomplete.ModelSelect2(url='director-autocomplete'))

    orientacion = forms.ModelChoiceField(queryset=Orientacion.objects.all(), required=True,
                                         widget=autocomplete.ModelSelect2(url='orientacion-autocomplete'))

    class Meta:
        model = Proyecto
        fields = ('__all__')


class AlumnoForm(forms.ModelForm):
    orientacion = forms.ModelChoiceField(queryset=Orientacion.objects.all(), required=False,
                                         widget=autocomplete.ModelSelect2(url='orientacion-autocomplete'))

    class Meta:
        model = Alumno
        fields = ('__all__')

