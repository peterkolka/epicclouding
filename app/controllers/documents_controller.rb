class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
  #  if params[:id].present?
    #  @document_folder = DocumentFolder.find(params[:id])
    #   @documents = @document_folder.documents
  #  end
    
 
 
     @documents = current_user.documents #Document.all #where(user_id: current_user.id)
  



    respond_to do |format|
      format.html # index.html.erb
   #   format.json { render json: @documents }
    
      #  format.json { render json: @document_folder.documents.map{|document| document.to_jq_upload } } 
 
        format.json { render json: @documents.map{|document| document.to_jq_upload } }        

    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
         @document = Document.find(params[:id])   
 #   if @document.shares.count > 0
    # if @document.shares.present? && !@document.shares.first.encrypted_password.blank?
    #   redirect_to root_url
  #    end
#   else

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @document }
      end
#    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @documents.map{|document| document.to_jq_upload } }
      
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create

    
    @document = current_user.documents.create(params[:document])

   respond_to do |format|
      if @document.save
        format.html  {
                   render :json => [@document.to_jq_upload].to_json,
                   :content_type => 'text/html',
                   :layout => false
                 }
        format.json { render json: [@document.to_jq_upload].to_json, status: :created, location: @document }
      else
       format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to root_url , notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end
end
