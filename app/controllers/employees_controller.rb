class EmployeesController < ApplicationController

  layout false, :except => [:index, :show]
  def index
    # createEmployees
    showEmployeesList
  end
  def show
    if params[:id].present?
      showEmployeesList
      @employee = Employee.find(params[:id])
      # get assistants method
      getAssistants(params[:id])
      render :'employees/show'
    else
      @employee = nil
      render :'employees/index'
    end
  end
  def showAssistants
    # respond_to do |format|
    #   format.html
    #   format.text
    # end
    respond_to :html, :xml, :json
  end




  private
  def createEmployees
    # @employee = Employee.new(name:'Иванов Иван Иванович')
    @employee = Employee.new(name:'Петров Сергей 2', boss_id: 2)
    @employee.save
  end
  def showEmployeesList
    @employees = Employee.all
  end
  def getAssistants(employee_id)
    @assistants = Employee.where('boss_id = ' + employee_id).all
  end
end
