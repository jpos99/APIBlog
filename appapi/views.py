from rest_framework import viewsets, generics
from appapi.serializer import AutorSerializer, PostagemSerializer, ListaPostagensAutorSerializer, UsuariosSerializer
from appapi.models import *
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated


class AutoresViewSet(viewsets.ModelViewSet):
    """ Exibe todos os autores """

    queryset = Autor.objects.all()
    serializer_class = AutorSerializer


class PostagensViewSet(viewsets.ModelViewSet):
    """ Exibe todos os posts """

    queryset = Postagem.objects.all()
    serializer_class = PostagemSerializer
    authentication_classes = [BasicAuthentication]
    permission_classes = [IsAuthenticated]


class ListaPostagensViewSet(generics.ListAPIView):
    """ Exibe os posts de um determinado autor """
    def get_queryset(self):
        queryset = Postagem.objects.filter(autor_postagem=self.kwargs['pk'])
        return queryset
    serializer_class = ListaPostagensAutorSerializer

    authentication_classes = [BasicAuthentication]
    permission_classes = [IsAuthenticated]


class UsuariosViewSet(viewsets.ModelViewSet):
    """ Exibe todos os usuarios cadastrados """
    queryset = User.objects.all()
    serializer_class = UsuariosSerializer
    http_method_names = ['get', 'post', 'put', 'path']
    authentication_classes = [BasicAuthentication]
    permission_classes = [IsAuthenticated]