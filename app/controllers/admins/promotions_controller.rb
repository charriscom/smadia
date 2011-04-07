class Admins::PromotionsController < AdminController
  
  uses_tiny_mce 
  
  # GET /admins/promotions
  # GET /admins/promotions.xml
  def index
    @promotions = Promotion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @promotions }
    end
  end

  # GET /admins/promotions/1
  # GET /admins/promotions/1.xml
  def show
    @promotion = Promotion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @promotion }
    end
  end

  # GET /admins/promotions/new
  # GET /admins/promotions/new.xml
  def new
    @promotion = Promotion.new
    @promotion.build_category
    (1..5).each do 
      @promotion.images.build
    end
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @promotion }
    end
  end

  # GET /admins/promotions/1/edit
  def edit
    @promotion = Promotion.find(params[:id])
    @categories = Category.all
    (1..5-@promotion.images.count).each do 
      @promotion.images.build
    end
  end

  # POST /admins/promotions
  # POST /admins/promotions.xml
  def create
    @promotion = Promotion.new(params[:promotion])
    @categories = Category.all
    respond_to do |format|
      if @promotion.save
        format.html { redirect_to admins_promotion_path(@promotion, :notice => 'Promotion was successfully created.') }
        format.xml  { render :xml => @promotion, :status => :created, :location => @promotion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admins/promotions/1
  # PUT /admins/promotions/1.xml
  def update
    @promotion = Promotion.find(params[:id])
    @categories = Category.all
    debugger
    respond_to do |format|
      if @promotion.update_attributes(params[:promotion])
        format.html { redirect_to admins_promotion_path(@promotion, :notice => 'Promotion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/promotions/1
  # DELETE /admins/promotions/1.xml
  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy

    respond_to do |format|
      format.html { redirect_to(promotions_url) }
      format.xml  { head :ok }
    end
  end
end
