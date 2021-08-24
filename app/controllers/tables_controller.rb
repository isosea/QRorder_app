class TablesController < ApplicationController
  def new
    @table = Table.new if logged_in?
  end

  def show
    @table = Table.find_by(id: params[:id])
    session[:table_id] = @table.table_number
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      flash[:success] = "テーブルが追加されました"
      redirect_to root_url
    else
      flash[:danger] = "ログインしてください"
      redirect_to root_url
    end
  end

  private

    def table_params
      params.require(:table).permit(:table_number)
    end
end
