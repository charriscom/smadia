class Admins::VideosController < AdminController
  # GET /admins/videos
  # GET /admins/videos.xml
  def index
    @videos = Video.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
      format.xls  {ModelXls.new(Video) ;send_file "#{Rails.root}/tmp/xls/Videos.xls"}
    end
  end

  # GET /admins/videos/1
  # GET /admins/videos/1.xml
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /admins/videos/new
  # GET /admins/videos/new.xml
  def new
    @video = Video.new
    category = Category.where("name = 'Videos'")
    category.empty? ? @video.build_category : @video.category = category.first 
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /admins/videos/1/edit
  def edit
    @video = Video.find(params[:id])
    @categories = Category.all
  end

  # POST /admins/videos
  # POST /admins/videos.xml
  def create
    @video = Video.new(params[:video])
    @categories = Category.all

    respond_to do |format|
      if @video.save
        format.html { redirect_to admins_video_path(@video, :notice => 'Video was successfully created.') }
        format.xml  { render :xml => @video, :status => :created, :location => @video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admins/videos/1
  # PUT /admins/videos/1.xml
  def update
    @video = Video.find(params[:id])
    @categories = Category.all

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to admins_video_path(@video, :notice => 'Video was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/videos/1
  # DELETE /admins/videos/1.xml
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(videos_url) }
      format.xml  { head :ok }
    end
  end
end
