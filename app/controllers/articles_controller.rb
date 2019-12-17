class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def new()
    @article = Article.new
  end
  def index
    @articles = Article.all
  end

  def create()
    #render plain: params[:article].inspect
    @article = Article.create(article_param)
    if @article.save
      flash[:success] = 'Article created sucessfully'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @article.update(article_param)
      flash[:success] = "Articel updated successfully"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was deleted successfully"
    redirect_to articles_path    
  end


  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_param
      params.require(:article).permit(:title, :description)
    end


end