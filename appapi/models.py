from django.db import models
from django.contrib.auth.models import User


class Autor(models.Model):
    classifica = (
        ('a', 'Diamante'),
        ('b', 'Ouro'),
        ('c', 'Prata')
    )
    nome_autor = models.CharField(max_length=100, null=False, blank=False, unique=True)
    classificacao_autor = models.CharField(max_length=1, choices=classifica, blank=False, null=False, default='c')
    usuario_autor = models.ForeignKey(User, on_delete=models.CASCADE)
    foto_autor = models.ImageField(blank=True, null=True)

    def __str__(self):
        return self.nome_autor


class Postagem(models.Model):
    titulo_postagem = models.CharField(max_length=100, unique=True)
    resumo_postagem = models.TextField(max_length=400)
    corpo_postagem = models.TextField()
    autor_postagem = models.ForeignKey(Autor, on_delete=models.CASCADE)
    data_postagem = models.DateTimeField(auto_now=True, editable=False)
    atualizacao_postagem = models.DateTimeField(auto_now_add=True, editable=False, null=True, blank=True)

    def __str__(self):
        return self.titulo_postagem


class Log(models.Model):
    usuario_log = models.ForeignKey(User, on_delete=models.DO_NOTHING, editable=False)
    acao_log = models.TextField(editable=False, null=False, blank=False)
    data_log = models.DateTimeField(auto_now=True, null=False, blank=False)
