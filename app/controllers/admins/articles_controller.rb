class Admins::ArticlesController < AdminController
  
  uses_tiny_mce 
  
  # GET /admins/articles
  # GET /admins/articles.xml
  def index
    @articles = Article.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      format.xls  {ModelXls.new(Article) ;send_file "#{Rails.root}/tmp/xls/Articles.xls"}
    end
  end

  # GET /admins/articles/1
  # GET /admins/articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /admins/articles/new
  # GET /admins/articles/new.xml
  def new
    @article = Article.new
    @article.build_thumb
    @article.build_carrusel_image
    category = Category.where("name = 'Articulos'")
    category.empty? ? @article.build_category : @article.category = category.first
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /admins/articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  # POST /admins/articles
  # POST /admins/articles.xml
  def create
    @article = Article.new(params[:article])
    @categories = Category.all
    respond_to do |format|
      if @article.save
        format.html { redirect_to admins_article_path(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admins/articles/1
  # PUT /admins/articles/1.xml
  def update
    @article = Article.find(params[:id])
    @categories = Category.all
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to admins_article_path(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/articles/1
  # DELETE /admins/articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admins_articles_url) }
      format.xml  { head :ok }
    end
  end

end