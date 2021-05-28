from django.urls import path, include
from appapi.views import AutoresViewSet, PostagensViewSet, ListaPostagensViewSet, UsuariosViewSet
from rest_framework import routers
from django.conf import settings
from django.conf.urls.static import static
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
   openapi.Info(
      title="Blog API",
      default_version='v1',
      description="Blog simples",
      terms_of_service="#",
      contact=openapi.Contact(email="jpos1303@gmail.com"),
      license=openapi.License(name="MIT License"),
   ),
   public=True,
   permission_classes=[permissions.AllowAny],
)

router = routers.DefaultRouter()
router.register('postagens', PostagensViewSet, basename='Postagens')
router.register('autores', AutoresViewSet, basename='Autores')
router.register('usuarios', UsuariosViewSet, basename='Usuarios')

urlpatterns = [
    path('', include(router.urls)),
    path('autor/<int:pk>/postagens/', ListaPostagensViewSet.as_view()),
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)