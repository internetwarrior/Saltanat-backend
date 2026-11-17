from django.contrib import admin
from .models import Product


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = (
        'id',
        'title',
        'price',
        'is_available',
        'created_at',
    )

    list_display_links = ('id', 'title')

    list_filter = ('is_available', 'created_at')

    search_fields = ('title', 'description')

    list_editable = ('price', 'is_available')

    ordering = ('-created_at',)