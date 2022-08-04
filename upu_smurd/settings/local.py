from .base import *
from .base import env


DEBUG = True


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = env('DJANGO_SECRET_KEY', default='django-insecure-7sk0&@-)wbj3*m7o6r-*pb@ji%i$8-u30=iri_29hd$gwbq+f_')

ALLOWED_HOSTS = ['localhost', '0.0.0.0', '127.0.0.1']

EMAIL_BACKEND = "djcelery_email.backends.CeleryEmailBackend"
EMAIL_HOST = env("EMAIL_HOST", default="mailhog")
EMAIL_PORT = env("EMAIL_PORT")
DEFAULT_FROM_EMAIL = "info@upusmurdcluj.ro"
DOMAIN = env("DOMAIN")
SITE_NAME = "UPU-SMURD Cluj"
