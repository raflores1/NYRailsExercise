class PhotopostsController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :new ]
  before_action :set_photopost, except: [:index, :new]
  before_action :set_user

  def new
    @photopost = current_user.photoposts.build
  end

  def index
        @photoposts = Photopost.all
  end

  def show

  end

  def edit
  end


  def destroy
    @photopost.destroy
    respond_to do |format|
      format.html { redirect_to '/profile', notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
    if @photopost.update(photopost_params)
        format.html { redirect_to '/profile', :notice => 'Photo was successfully updated.' }
        format.json { render :json => @photopost, :status => :ok, :location => @photopost }
      else
        format.html { render :edit }
        format.json { render :json => @photopost.errors, :status => :unprocessable_entity }
      end
    end

    end

  def create
    @photopost = current_user.photoposts.build(photopost_params)
    respond_to do |format|
      if @photopost.save
        format.html { redirect_to @photopost, :notice => 'Photo was successfully created.' }
        format.json { render :json => @photopost, :status => :created, :location => @photopost }
      else
        format.html { render :action => "new" }
        format.json { render :json => @photopost.errors, :status => :unprocessable_entity }
      end
    end
    end


    private

  def set_user
    @user = current_user
  end

  def set_photopost
    @photopost = Photopost.find(params[:id])
  end

    def photopost_params
      params.require(:photopost).permit( :title, :url )
    end
end
