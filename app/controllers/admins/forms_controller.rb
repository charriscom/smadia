class Admins::FormsController < AdminController
  uses_tiny_mce 
  
  # GET /admins/forms
  # GET /admins/forms.xml
  def index
    @forms = Form.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forms }
    end
  end

  # GET /admins/forms/1
  # GET /admins/forms/1.xml
  def show
    @form = Form.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form }
    end
  end

  # GET /admins/forms/1/edit
  def edit
    @form = Form.find(params[:id])
  end
  
  # PUT /admins/forms/1
  # PUT /admins/forms/1.xml
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to admins_form_path(@form, :notice => 'Form was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @form.errors, :status => :unprocessable_entity }
      end
    end
  end
end
