from django.contrib import admin
from appapi.models import *


class Postagens(admin.ModelAdmin):
    list_display = ('id', 'titulo_postagem', 'resumo_postagem', 'corpo_postagem', 'autor_postagem', 'data_postagem')
    list_display_links = ('titulo_postagem', 'resumo_postagem', 'corpo_postagem')
    search_fields = ('id', 'titulo_postagem', 'autor_postagem', 'data_postagem')
    list_per_page = 50


admin.site.register(Postagem, Postagens)


class Autores(admin.ModelAdmin):
    list_display = ('id', 'nome_autor')
    list_display_links = ('nome_autor',)
    search_fields = ('id', 'nome_autor')
    list_per_page = 50


admin.site.register(Autor, Autores)