class VideosController < ApplicationController
  before_action :signed_in_user
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @dvd = Dvd.find(params[:dvd_id])
    @videos = Video.all
    # @videos = current_dvd.videos.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @dvd = Dvd.find(params[:dvd_id])
  end

  # GET /videos/new
  def new
    @dvd = Dvd.find(params[:dvd_id])
    @video = Video.new

  end

  # GET /videos/1/edit
  def edit
      @dvd = Dvd.find(params[:dvd_id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @dvd = Dvd.find(params[:dvd_id])
    @video = @dvd.videos.new(video_params)
    #@video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to dvd_videos_path, notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to dvd_videos_path, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to dvd_videos_path, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title)
    end
end
