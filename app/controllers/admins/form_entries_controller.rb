class Admins::FormEntriesController < AdminController
  # GET /admins/form_entries
  # GET /admins/form_entries.xml
  def index
    @form_entries = FormEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @form_entries }
    end
  end

  # GET /admins/form_entries/1
  # GET /admins/form_entries/1.xml
  def show
    @form_entry = FormEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form_entry }
    end
  end

  # GET /admins/form_entries/new
  # GET /admins/form_entries/new.xml
  def new
    @form_entry = FormEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @form_entry }
    end
  end

  # GET /admins/form_entries/1/edit
  def edit
    @form_entry = FormEntry.find(params[:id])
  end

  # POST /admins/form_entries
  # POST /admins/form_entries.xml
  def create
    @form_entry = FormEntry.new(params[:form_entry])

    respond_to do |format|
      if @form_entry.save
        format.html { redirect_to(@form_entry, :notice => 'Form entry was successfully created.') }
        format.xml  { render :xml => @form_entry, :status => :created, :location => @form_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @form_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admins/form_entries/1
  # PUT /admins/form_entries/1.xml
  def update
    @form_entry = FormEntry.find(params[:id])

    respond_to do |format|
      if @form_entry.update_attributes(params[:form_entry])
        format.html { redirect_to(@form_entry, :notice => 'Form entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @form_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/form_entries/1
  # DELETE /admins/form_entries/1.xml
  def destroy
    @form_entry = FormEntry.find(params[:id])
    @form_entry.destroy

    respond_to do |format|
      format.html { redirect_to(form_entries_url) }
      format.xml  { head :ok }
    end
  end
end
