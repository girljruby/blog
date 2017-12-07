class ArticlesController < ApplicationController
	
  #an index action, the usual practice is to place it as the first method in the controller
  def index
     @articles = Article.all
   end
  
  def new
    @article = Article.new
	end
	
	def create
  # render plain: params[:article].inspect
    
	  # the new Article model to save the data in the database	  
	  
=begin
    every Rails model can be initialized with its respective attributes, 
      which are automatically mapped to the respective database columns. 
    params[:article] contains the attributes we're interested in
	  
	  Siuo budu negalesime issaugoti straipsnio, nes del saugumo problemu. Reikia nurodyti kokie 
	  yra galimi parametrai
=end	  
	 # @article = Article.new(params[:article])
    
	  
=begin
    We have to whitelist our controller parameters to prevent wrongful mass assignment. 
	  In this case, we want to both allow and require the title and text parameters 
	  for valid use of create. The syntax for this introduces require and permit.
	  The change will involve one line in the create action
=end
	  # Refaktorizuojame, kad galetume panaudoti ir update metode
   # @article = Article.new(params.require(:article).permit(:title, :text))
	    
=begin
    This is often factored out into its own method so it can be reused
	  by multiple actions in the same controller, for example create and
	  update. Above and beyond mass assignment issues, the method is 
	  often made private to make sure it can't be called outside its 
	  intended context
=end	    
    @article = Article.new(article_params)
	    
=begin
    @article.save is responsible for saving the model in the database.
    @article.save returns a boolean indicating whether the article was saved or not.
=end
    # Nebetinka, nes ikeleme validation   @article.save
     
=begin
    redirect the user to the show action
=end
   # Nebetinka, nes ikeleme validation  redirect_to @article
     
    if @article.save
        redirect_to @article
      else
        render 'new'
      end 
     
	end
	
  def show
     @article = Article.find(params[:id])
   end
	
	
	
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
	
	
end
