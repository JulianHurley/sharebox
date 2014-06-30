class FoldersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    
    @folders = current_user.folders.all
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  # GET /folders/new
  def new
    @folder = current_user.folders.new

    if params[:parent_id] # if weve arrived here via the new_sub_folder path. This action is in charge of creating orphan folders AND sub folders
      @parent_folder = current_user.folders.find(params[:parent_id])
      @folder.parent_id = @parent_folder.id
    end
  end
  # POST /folders
  # POST /folders.json
  def create
    @folder = current_user.folders.new(folder_params)

    if @folder.save
      if @folder.parent # acts_as_tree helper
        redirect_to browse_path(@folder.parent),  notice: 'Folder was successfully created.'
      else
        redirect_to root_url, notice: 'Folder was successfully created.'        
      end
    else
      format.html { render :new }
      format.json { render json: @folder.errors, status: :unprocessable_entity }
    end
  end
  
  # GET /folders/1/edit
  def edit
  end



  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    folder = current_user.folders.find(params[:id])
    parent_folder = folder.parent

    folder.destroy

    flash[:notice] = 'successfully delted the folder'

    if parent_folder
      redirect_to browse_path(parent_folder.id)#, status: 302
    else
      redirect_to root_url#, status: 302
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = current_user.folders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      ap params

      params.require(:folder).permit(:name, :parent_id, :user_id)
    end
end
