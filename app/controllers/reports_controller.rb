# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
    @comments = @report.comments.preload(:user)
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    redirect_to report_url(@report) if @report.user_id != current_user.id
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)

    @report.user_id = current_user.id

    if @report.save
      redirect_to report_url(@report), notice: t('.report_create')
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    if @report.user_id == current_user.id
      if @report.update(report_params)
        redirect_to report_url(@report), notice: t('.message_change')
      else
        render :edit
      end
    else
      redirect_to report_url
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    if @report.user_id == current_user.id
      if @report.destroy
        redirect_to reports_url, notice: t('.report_destroy')
      else
        redirect_to reports_url, notice: t('.no_destroy')
      end
    else
      redirect_to reports_url, notice: t('.no_destroy')
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
