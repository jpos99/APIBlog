from rest_framework.test import APITestCase, force_authenticate
from rest_framework import status

import json
from appapi.models import Autor, Postagem
from django.contrib.auth.models import User

from django.urls import reverse


class AutorTestCase(APITestCase):

    def setUp(self):
        self.list_url = reverse('Autores-list')
        self.usuario_de_teste = User.objects.create_user(
            username='usuario_teste',
            password='uma_senha_boa'
        )

        self.autor_1 = Autor.objects.create(
            nome_autor='TesteAutor',
            classificacao_autor='b',
            usuario_autor=self.usuario_de_teste,
            foto_autor='sasuke.png'
        )
        self.autor_2 = Autor.objects.create(
            nome_autor='TesteAutor2',
            classificacao_autor='a',
            usuario_autor=self.usuario_de_teste,
            foto_autor='naruto.jpeg'
        )

    def test_requisicao_get_lista_autor(self):
        """Teste de requisição GET lista de autores"""
        response = self.client.get(self.list_url)
        force_authenticate(response, user=self.usuario_de_teste)
        self.assertEquals(response.status_code, status.HTTP_200_OK)

    def test_requisicao_post_criar_autor(self):
        """Teste de requisição POST cria Autor"""
        data = {
            'nome_autor': 'Novo_Autor_teste',
            'calssificacao_autor': 'a',
            'usuario_autor': self.usuario_de_teste,
            'foto_Autor': ''
        }
        response = self.client.post(self.list_url, data=data)
        force_authenticate(response, user=self.usuario_de_teste)
        self.assertEquals(response.status_code, status.HTTP_201_CREATED)

    def test_requisicao_put_autor(self):
        """Teste de requisição PUT Autor"""
        data = {
            'nome_autor': 'TesteAutor2',
            'calssificacao_autor': 'c',
            'usuario_autor': self.usuario_de_teste,
            'foto_Autor': ''
        }

        response = self.client.put('/autores/1', data=data)
        force_authenticate(response, user=self.usuario_de_teste)
        self.assertEquals(response.status_code, status.HTTP_200_OK)

    def test_requisicao_delete_autor(self):
        """Teste de requisição DELETE Autor não permitida"""
        response = self.client.delete('/autores/1/')
        self.assertEquals(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)

class PostagemTestCase(APITestCase):

    def setUp(self):
        self.list_url = reverse('Postagens-list')
        self.usuario_de_teste = User.objects.create_user(
            username='usuario_teste',
            password='uma_senha_boa'
        )

        self.autor_1 = Autor.objects.create(
            nome_autor='TesteAutor',
            classificacao_autor='b',
            usuario_autor=self.usuario_de_teste,
            foto_autor='sasuke.png'
        )

        self.postagem_1 = Postagem.objects.create(
            titulo_postagem='Postagem Teste',
            resumo_postagem='Resumo postagem teste',
            corpo_postagem='Este é o corpo de uma postagem de teste',
            autor_postagem=self.autor_1,

        )

    def test_requisicao_get_lista_postagem(self):
        """Teste de requisição GET retornando lista de postagens"""
        response = self.client.get(self.list_url)
        force_authenticate(response, user=self.usuario_de_teste)
        self.assertEquals(response.status_code, status.HTTP_200_OK)

    def test_requisicao_post_lista_postagem(self):

        """Teste de requisição POST cria Postagem"""
        data = {
            'titulo_postagem': 'Postagem post Teste',
            'resumo_postagem': 'Resumo postagem teste post',
            'corpo_postagem': 'Este é o corpo de uma postagem de teste de post',
            'autor_postagem': self.autor_1,
        }

        response = self.client.post(self.list_url, data=data)
        force_authenticate(response, user=self.usuario_de_teste)
        self.assertEquals(response.status_code, status.HTTP_201_CREATED)

    def test_requisicao_put_lista_postagem(self):

        """Teste de requisição PUT altera Postagem"""
        data = {
            'titulo_postagem': 'Postagem post Teste',
            'resumo_postagem': 'Resumo postagem teste post',
            'corpo_postagem': 'Este é o corpo de uma postagem de teste de post',
            'autor_postagem': self.autor_1,
        }

        response = self.client.put('/postagens/1/', data=data)
        force_authenticate(response, user=self.usuario_de_teste)
        self.assertEquals(response.status_code, status.HTTP_200_OK)