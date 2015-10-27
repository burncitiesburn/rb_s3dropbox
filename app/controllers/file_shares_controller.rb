class FileSharesController < ApplicationController
  before_action :set_file_share, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  # GET /file_shares
  # GET /file_shares.json
  def index
    @file_shares = FileShare.all
  end

  # GET /file_shares/1
  # GET /file_shares/1.json
  def show
  end

  # GET /file_shares/new
  def new
    @file_share = FileShare.new
  end

  # GET /file_shares/1/edit
  def edit
  end

  # POST /file_shares
  # POST /file_shares.json
  def create
    @file_share = FileShare.new(file_share_params)

    respond_to do |format|
      if @file_share.save
        flash[:success] = 'File share was successfully created.'
        format.html { redirect_to @file_share }
        format.json { render :show, status: :created, location: @file_share }
      else
        flash[:danger] = 'There was a problem creating the file share'
        format.html { render :new }
        format.json { render json: @file_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_shares/1
  # PATCH/PUT /file_shares/1.json
  def update
    respond_to do |format|
      if @file_share.update(file_share_params)
        flash[:success] = 'File share was successfully updated'
        format.html { redirect_to @file_share }
        format.json { render :show, status: :ok, location: @file_share }
      else
        flash[:danger] = 'There was a problem creating the file share'
        format.html { render :edit }
        format.json { render json: @file_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_shares/1
  # DELETE /file_shares/1.json
  def destroy
    @file_share.destroy
    respond_to do |format|
        flash[:success] = 'File share was successfully destoryed'
        format.html { redirect_to @file_share }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_share
      @file_share = FileShare.find(params[:id])
    end

    #setup function to allow users to direct post to s3 bucket
    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_share_params
      params.require(:file_share).permit(:user, :file_url)
    end
end
