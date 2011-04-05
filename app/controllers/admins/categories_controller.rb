class Admins::CategoriesController < AdminController
  # GET /admins/categories
  # GET /admins/categories.xml
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /admins/categories/1
  # GET /admins/categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /admins/categories/new
  # GET /admins/categories/new.xml
  def new
    @category = Category.new
    @category.build_parent_category
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /admins/categories/1/edit
  def edit
    @category = Category.find(params[:id])
    @categories = Category.where("id != ?", @category.id)
  end

  # POST /admins/categories
  # POST /admins/categories.xml
  def create
    @category = Category.new(params[:category])
    @categories = Category.all
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to admins_category_path(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admins/categories/1
  # PUT /admins/categories/1.xml
  def update
    @category = Category.find(params[:id])
    @categories = Category.where("id != ?", @category.id)
    
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to admins_category_path(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/categories/1
  # DELETE /admins/categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(admins_categories_url) }
      format.xml  { head :ok }
    end
  end
end
