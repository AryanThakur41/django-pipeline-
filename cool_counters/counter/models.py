from django.db import models

class Counter(models.Model):
    id = models.BigAutoField(primary_key=True)
    key = models.CharField(max_length=10)
    value = models.IntegerField() 
