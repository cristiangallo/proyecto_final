# -*- coding: UTF-8 -*-

from django.conf.urls import url, include
from django.conf.urls.static import static
from django.contrib import admin
from django.conf import settings
from proyecto.views import DirectorAutocomplete, OrientacionAutocomplete, upload_alumnos, download_csv_data
from django.views.generic.base import RedirectView


urlpatterns = [

    url(r'^admin/', admin.site.urls),

    url(r'^$', RedirectView.as_view(url='/admin/', permanent=False), name='index'),

    url(r'^admin/upload-alumnos/$', upload_alumnos, name='upload-alumnos'),

    url(r'^admin/download-csv-proyectos/$', download_csv_data, name='download-csv-proyectos'),

    url(r'^director-autocomplete/$', DirectorAutocomplete.as_view(), name='director-autocomplete'),

    url(r'^orientacion-autocomplete/$', OrientacionAutocomplete.as_view(create_field='descripcion'),
        name='orientacion-autocomplete'),

]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
