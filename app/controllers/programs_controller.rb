class ProgramsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :details]
  before_action :logged_in_user, only: [:create, :destroy]
  load_and_authorize_resource
  skip_authorize_resource :only => :details

  # GET /programs
  # GET /programs.json
  def index
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
  end

  # GET /programs/1/details
  def details
  end

  # GET /programs/new
  def new
    @program = current_user.programs.build
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = current_user.programs.build(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    flash[:success] = "Program deleted"
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def program_params
    params.require(:program).permit(:name, :description, :price, :user_id, :picture, :enterprise_id)
  end
end
