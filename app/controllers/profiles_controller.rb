class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  
  skip_before_filter :make_profile
  
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    if @profile.update_attributes(params[:profile])
      if params[:profile][:avatar].present?
        render :crop
      else
        redirect_to @profile, notice: "Successfully updated user."
      end
    else
      render :new
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    if @profile.update_attributes(params[:profile])
      if params[:profile][:avatar].present?
        render :crop
      else
        redirect_to @profile, notice: "Successfully updated user."
      end
    else
      render :new
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end
