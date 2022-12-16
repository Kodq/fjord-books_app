# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
    @report = Report.find(params[:id])
    @comment = Comment.new
    @comments = @report.comments
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
    redirect_to report_path unless @report.userid == current_user.id
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)

    @report.userid = current_user.id

    if @report.save
      redirect_to report_url(@report), notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    if @report.userid == current_user.id
      @report.destroy
      redirect_to reports_url, notice: 'Report was successfully destroyed.'
    else
      redirect_to reports_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :text)
  end
end
