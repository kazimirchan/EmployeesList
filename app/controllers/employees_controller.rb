class EmployeesController < ApplicationController

  layout false, :except => :show

  def index
    show
  end
  def show
    # createEmployees
    showEmployeesList
    if params[:id].present?
      @employee = Employee.find(params[:id])
      # get assistants method
      getAssistants(params[:id])
    else
      @emplArray = Employee.where('boss_id is null').all.order("name ASC")
    end
  end

  def showAssistants
    respond_to :json
    render json: getAssistants(params[:id])
  end


  private

  def createEmployees
    # @employee = Employee.new(name:'Иванов Иван Иванович')
    @employee = Employee.new(name: 'Петров Сергей test')
    @employee.save
    @employee = Employee.new(name: 'Петров Сергей test')
    @employee.save
  end

  def showEmployeesList
    @employees = Employee.all
  end

  def getAssistants(employee_id)
    @assistants = Employee.where('boss_id = ' + employee_id).all.order("name ASC")
  end
end
