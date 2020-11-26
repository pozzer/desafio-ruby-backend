class ImportsController < ApplicationController

  def import
    importer = CnabImport::Import.new(File.read(params[:file].tempfile)).call
    unless importer.errors.any?
      flash[:notice] = "#{importer.count} transactions were imported."
    else
      flash[:error] = "Invalid format Cnab"
    end

    respond_with nil, location: -> { stores_path }       
  end

end