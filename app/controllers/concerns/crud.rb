module Crud
  extend ActiveSupport::Concern

  def index
    authorize controller_name.classify.underscore.to_sym
    load_resources
  end

  def show
    load_resource
    authorize @resource
  end

  def new
    build_resource
    authorize @resource
  end

  def edit
    load_resource
    authorize @resource
  end

  def create
    build_resource
    authorize @resource
    save_resource || render('new')
  end

  def update
    load_resource
    authorize @resource
    build_resource
    save_resource || render('edit')
  end

  def destroy
    load_resource
    authorize @resource
    @resource.destroy
    redirect_to polymorphic_path(namespaces + [controller_name])
  end

  private

  def build_resource
    @resource            ||= resources_scope.build
    @resource.attributes = resource_params
  end

  def save_resource
    if @resource.save
      respond_to do |format|
        format.html do
          redirect_to save_redirect_path
        end
      end
    end
  end

  def resource_params
    permitted_attributes(@resource) rescue {}
  end

  def resources_scope
    load_parent
    @parent ? @parent.send(controller_name) : model_name.all
  end

  def load_resources
    @resources = resources_scope
  end

  def load_resource
    @resource ||= resources_scope.find(params[:id])
  end

  def load_parent
    @parent ||= parent
  end

  def namespaces
    []
  end

  def parent
    nil
  end

  def model_name
    controller_name.classify.constantize
  end

  def save_redirect_path
    polymorphic_path(namespaces + [controller_name])
  end
end
