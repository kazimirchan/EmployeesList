class EmployeesController < ApplicationController
  def index
    # createEmployees
    showEmployeesList
  end
  def show
    if params[:remote].present?
      respond_to do |format|
        format.html
        format.json { render :json => {"123" => "1234"} }
      end
    elsif params[:id].present?
      showEmployeesList
      @employee = Employee.find(params[:id])
      # get assistants method
      getAssistants(params[:id])
    else
      @employee = nil
    end
  end
  def showAssistants
    respond_to do |format|
      format.html
      format.json { render :json => {"123" => "1234"} }
    end
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
