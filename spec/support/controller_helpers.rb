module ControllerHelpers
  def login_as(resource_or_scope, resource = nil)
    scope ||= Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope

    if resource.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope })
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(resource)
    end

    allow(controller).to receive("current_#{scope}").and_return(resource)
  end
end