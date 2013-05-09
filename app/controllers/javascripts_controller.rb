class JavascriptsController < ApplicationController
  respond_to :text

  def check_for_uniqueness
    record = params[:model].constantize.where("#{params[:field]} = ?", params[params[:model].downcase.underscore][params[:field]])
    return render :text => true if record.count.zero? || record.first.id == params[:id].to_i
    render :text => "\"#{params[params[:model].downcase.underscore][params[:field]]} is already taken.\""
  end
end
