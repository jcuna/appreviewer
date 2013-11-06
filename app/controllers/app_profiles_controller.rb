class AppProfilesController < ApplicationController
  # GET /app_profiles
  # GET /app_profiles.json
  def index
    @app_profiles = AppProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @app_profiles }
    end
  end

  # GET /app_profiles/1
  # GET /app_profiles/1.json
  def show
    @app_profile = AppProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app_profile }
    end
  end

  # GET /app_profiles/new
  # GET /app_profiles/new.json
  def new
    @app_profile = AppProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app_profile }
    end
  end

  # GET /app_profiles/1/edit
  def edit
    @app_profile = AppProfile.find(params[:id])
  end

  # POST /app_profiles
  # POST /app_profiles.json
  def create
    #@app_profile = AppProfile.new(params[:app_profile])
    @app_profile = Status.find_by_application(params[:id])
    respond_to do |format|
      if @app_profile.save
        format.html { redirect_to @app_profile, notice: 'App profile was successfully created.' }
        format.json { render json: @app_profile, status: :created, location: @app_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @app_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /app_profiles/1
  # PUT /app_profiles/1.json
  def update
    @app_profile = AppProfile.find(params[:id])

    respond_to do |format|
      if @app_profile.update_attributes(params[:app_profile])
        format.html { redirect_to @app_profile, notice: 'App profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_profiles/1
  # DELETE /app_profiles/1.json
  def destroy
    @app_profile = AppProfile.find(params[:id])
    @app_profile.destroy

    respond_to do |format|
      format.html { redirect_to app_profiles_url }
      format.json { head :no_content }
    end
  end
end
