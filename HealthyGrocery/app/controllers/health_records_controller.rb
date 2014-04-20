class HealthRecordsController < ApplicationController
  # GET /health_records
  # GET /health_records.json
  def index
    @health_records = HealthRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @health_records }
    end
  end

  # GET /health_records/1
  # GET /health_records/1.json
  def show
    @health_record = HealthRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @health_record }
    end
  end

  # GET /health_records/new
  # GET /health_records/new.json
  def new
    @health_record = HealthRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @health_record }
    end
  end

  # GET /health_records/1/edit
  def edit
    @health_record = HealthRecord.find(params[:id])
  end

  # POST /health_records
  # POST /health_records.json
  def create
    @health_record = HealthRecord.new(params[:health_record])

    respond_to do |format|
      if @health_record.save
        format.html { redirect_to @health_record, notice: 'Health record was successfully created.' }
        format.json { render json: @health_record, status: :created, location: @health_record }
      else
        format.html { render action: "new" }
        format.json { render json: @health_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /health_records/1
  # PUT /health_records/1.json
  def update
    @health_record = HealthRecord.find(params[:id])

    respond_to do |format|
      if @health_record.update_attributes(params[:health_record])
        format.html { redirect_to @health_record, notice: 'Health record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @health_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_records/1
  # DELETE /health_records/1.json
  def destroy
    @health_record = HealthRecord.find(params[:id])
    @health_record.destroy

    respond_to do |format|
      format.html { redirect_to health_records_url }
      format.json { head :no_content }
    end
  end
end
