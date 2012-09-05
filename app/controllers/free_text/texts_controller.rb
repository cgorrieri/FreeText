require 'net/http'
class FreeText::TextsController < ApplicationController
#  before_filter FreeText.authentication.call
  
  def update
    editables = params["editables"]
    editables.each do |e|
      datas = e[1]
      editable_text = FreeText::Text.find_by_key_and_locale(datas["key"], datas["locale"])
      editable_text.update_attribute("content", datas["content"])
    end
    render :json => {:success => true}
  end

  def aloha_config
    @settings = FreeText.settings.to_s
    @repositories = hash_to_string(FreeText.getRepositories.call)
  end

  def tab_to_string(tab)
    tab.to_s.html_safe
  end

  def hash_to_string(hash)
    hash.to_s.gsub("=>", ": ").html_safe
  end

end
