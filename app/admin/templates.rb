ActiveAdmin.register_page 'Template' do
  action_item only: :index do
    link_to 'Upload CSV', action: 'upload_csv'
  end

  page_action :upload_csv do
    render 'admin/csv/upload_csv'
  end

  page_action :import_csv, method: :post do
    templates = CsvHelper.convert_to_templates(params[:dump][:file])
    Template.transaction do
      templates.each(&:save!)
    end
    redirect_to({ action: :index }, notice: 'CSV imported successfully!')
  rescue StandardError
    redirect_to({ action: :index },
                flash: { error: 'CSV imported failed! Check the template is correct or contact a developer.' })
  end
end
