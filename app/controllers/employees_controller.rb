class EmployeesController < ApplicationController

  layout false, :except => [:index, :show]

  def index
    # createEmployees
    showEmployeesList
  end

  def show
    showEmployeesList
    if params[:id].present?
      @employee = Employee.find(params[:id])
      # get assistants method
      getAssistants(params[:id])
    end
  end

  def showAssistants
    respond_to :json
    render json: getAssistants(params[:id])
  end


  private

  def createEmployees
    # @employee = Employee.new(name:'Иванов Иван Иванович')
    @employee = Employee.new(name: 'Петров Сергей test', boss_id: 5)
    @employee.save
  end

  def showEmployeesList
    @employees = Employee.all
  end

  def getAssistants(employee_id)
    @assistants = Employee.where('boss_id = ' + employee_id).all.order("name ASC")
  end
end
