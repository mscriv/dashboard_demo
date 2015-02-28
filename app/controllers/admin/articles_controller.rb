class Admin::ArticlesController < ApplicationController
  def index
  end

  def create
    @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_articles_url,
         notice: 'Article was successfully created.' }
        format.json { render json: @article,
         status: :created,
         location: [:admin,@article] }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors,
          status: :unprocessable_entity }
      end
    end
  end
end
