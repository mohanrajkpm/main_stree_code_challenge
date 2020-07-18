class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
    @company_decorator = helpers.decorate(@company)
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      flash[:error] = "<ul>" + @company.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
      render new_company_path
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      render :edit
    end
  end  

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: t('common.deleted_successfully', model_name: Company.name)
    else
      redirect_to companies_path, error: t('invalid_value')
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :legal_name,
      :description,
      :zip_code,
      :phone,
      :email,
      :owner_id,
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end
  
end
