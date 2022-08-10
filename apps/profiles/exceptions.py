from rest_framework.exceptions import APIException
from django.utils.translation import gettext_lazy as _


class NotYourProfile(APIException):
    status_code = 403
    default_detail = _("You cannot edit a profile that deosn't belong to you")
