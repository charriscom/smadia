class Admins::ArticlesController < AdminController
  
  uses_tiny_mce :options => {
                                :mode => "textareas",
                                :theme => 'advanced',
                                :theme_advanced_buttons1 => "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
                                :theme_advanced_buttons2 => "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                                :theme_advanced_buttons3 => "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                                :theme_advanced_buttons4 => "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
                                :theme_advanced_toolbar_location => "top",
                                :theme_advanced_toolbar_align => "left",
                                :theme_advanced_statusbar_location => "bottom",
                                :theme_advanced_resizing => true,
                                :theme_advanced_resize_horizontal => false,
                                :plugins => %w{ table fullscreen spellchecker pagebreak style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template },
                                
                              }
  
  # GET /admins/articles
  # GET /admins/articles.xml
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
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
    @article.build_category
    @article.build_image
    @article.build_carrusel_image
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
    debugger
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
