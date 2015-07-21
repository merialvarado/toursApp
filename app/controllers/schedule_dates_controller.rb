class ScheduleDatesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_schedule_date, only: [:show, :edit, :update, :destroy, :schedule]
  load_and_authorize_resource

  # GET /schedule_dates
  # GET /schedule_dates.json
  def index
    @schedule_dates = ScheduleDate.all
  end

  # GET /schedule_dates/1
  # GET /schedule_dates/1.json
  def show
  end

  # GET /schedule_dates/new
  def new
    @schedule_date = ScheduleDate.new
    @program_id = params[:program_id]
    @schedule_date.program_id = @program_id
  end

  # GET /schedule_dates/1/edit
  def edit
  end

  # POST /schedule_dates
  # POST /schedule_dates.json
  def create
    params[:schedule_date][:repeating_every].delete("")
    @schedule_date = ScheduleDate.new(schedule_date_params)

    respond_to do |format|
      if @schedule_date.save
        if schedule_date_params[:program_id].blank?
          format.html { redirect_to @schedule_date, notice: 'Schedule date was successfully created.' }
        else
          format.html { redirect_to program_path(schedule_date_params[:program_id]), notice: 'Schedule date was successfully created.' } 
        end
        format.json { render :show, status: :created, location: @schedule_date }
      else
        format.html { render :new }
        format.json { render json: @schedule_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_dates/1
  # PATCH/PUT /schedule_dates/1.json
  def update
    respond_to do |format|
      if @schedule_date.update(schedule_date_params)
        if schedule_date_params[:program_id].blank?
          format.html { redirect_to @schedule_date, notice: 'Schedule date was successfully updated.' }
        else
          format.html { redirect_to program_path(schedule_date_params[:program_id]), notice: 'Schedule date was successfully updated.' } 
        end
        format.json { render :show, status: :ok, location: @schedule_date }
      else
        format.html { render :edit }
        format.json { render json: @schedule_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_dates/1
  # DELETE /schedule_dates/1.json
  def destroy
    @schedule_date.destroy
    respond_to do |format|
      if params[:program_id].blank?
        format.html { redirect_to schedule_dates_url, notice: 'Schedule date was successfully destroyed.' }
      else
        format.html { redirect_to program_path(params[:program_id]), notice: 'Schedule date was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  def schedule
    send_data @schedule_date.schedule.to_yaml, :type => 'text', disposition: "attachment; filename = schedule_#{@schedule_date.id}.yml"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_date
      @schedule_date = ScheduleDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_date_params
      params.require(:schedule_date).permit(:event_repeats, :repeating_every_month, :repeating_every_day, :from_time, :to_time, :repeat_from_date, :repeat_to_date, :program_id, repeating_every:[])
    end
end
