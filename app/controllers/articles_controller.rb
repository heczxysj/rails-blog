class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "ethan", password: "123456", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new  #之所以因为如果不这样做，在视图中 @article 的值就会是 nil，这样在调用 @article.errors.any? 时就会抛出错误。
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      # redirect_to @article
      redirect_to :action => "show", :id => @article.id
    else
      render 'new'
    end
    # redirect_to :action => "show", :id => @article.id
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      # redirect_to @article
      redirect_to :action => "show", :id => @article.id
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
