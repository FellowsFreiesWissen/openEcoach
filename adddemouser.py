"""
Management utility to make a demo superuser.
"""

from django.core.management.base import BaseCommand
from django.contrib.auth.models import User


class Command(BaseCommand):
    help = 'Make a user a demo user.'

    def handle(self, *args, **options):
        User.objects.create_superuser(username='admin', password='admin', email='your@email.com')
