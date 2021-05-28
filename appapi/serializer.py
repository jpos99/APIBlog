from rest_framework import serializers
from appapi.models import *
from django.contrib.auth.models import User


class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = ['id', 'nome_autor', 'usuario_autor', 'classificacao_autor', 'foto_autor']



class PostagemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Postagem
        exclude = []


class ListaPostagensAutorSerializer(serializers.ModelSerializer):
    autor_postagem = serializers.ReadOnlyField(source='autor_postagem.nome_autor')
    class Meta:
        model = Postagem
        fields = ['autor_postagem', 'titulo_postagem', 'resumo_postagem',
                  'corpo_postagem', 'data_postagem', 'atualizacao_postagem'
                  ]


class UsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        exclude = ['password']
