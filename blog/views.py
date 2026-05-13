from django.shortcuts import render
from .models import Post

# Create your views here.
def index(request):
    posts = Post.objects.all().order_by('-pk')  # 데이터 조회 부분

    return render(
        request, 
        'blog/index.html', 
        {
            'posts' : posts, 
        }
    )