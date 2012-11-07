class DocumentFoldersController < ApplicationController
  # GET /document_folders
  # GET /document_folders.json
  def index
    @document_folders = DocumentFolder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_folders }
    end
  end

  # GET /document_folders/1
  # GET /document_folders/1.json
  def show
    @document_folder = DocumentFolder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_folder }
    end
  end

  # GET /document_folders/new
  # GET /document_folders/new.json
  def new
    @document_folder = DocumentFolder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_folder }
    end
  end

  # GET /document_folders/1/edit
  def edit
    @document_folder = DocumentFolder.find(params[:id])
  end

  # POST /document_folders
  # POST /document_folders.json
  def create
    @document_folder = DocumentFolder.new(params[:document_folder])

    respond_to do |format|
      if @document_folder.save
        format.html { redirect_to @document_folder, notice: 'Document folder was successfully created.' }
        format.json { render json: @document_folder, status: :created, location: @document_folder }
      else
        format.html { render action: "new" }
        format.json { render json: @document_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_folders/1
  # PUT /document_folders/1.json
  def update
    @document_folder = DocumentFolder.find(params[:id])

    respond_to do |format|
      if @document_folder.update_attributes(params[:document_folder])
        format.html { redirect_to @document_folder, notice: 'Document folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_folders/1
  # DELETE /document_folders/1.json
  def destroy
    @document_folder = DocumentFolder.find(params[:id])
    @document_folder.destroy

    respond_to do |format|
      format.html { redirect_to document_folders_url }
      format.json { head :no_content }
    end
  end
end
