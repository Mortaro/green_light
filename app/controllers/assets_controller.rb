class AssetsController < ApplicationController
  respond_to :js

  def green_light
    @rules = GreenLight::Rules.generate(GreenLight.validatable_models)
    respond_with(@rules, :layout => false)
  end
end
