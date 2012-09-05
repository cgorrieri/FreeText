module FreeText::TextHelper
  def free_text_init
    if FreeText.authentication.call(controller)
      aloha = "aloha-#{FreeText.alohaVersion}"
      result = stylesheet_link_tag "/assets/#{aloha}/css/aloha.css"
#      result += javascript_include_tag "/assets/#{aloha}/lib/require.js"
#      result += javascript_include_tag "/assets/#{aloha}/lib/vendor/jquery-1.7.2.js"
      result += javascript_include_tag "/assets/#{aloha}/lib/aloha.js", "data-aloha-plugins" => "common/format,common/highlighteditables,extra/externalsave#{FreeText.plugins}"
      result += javascript_include_tag aloha_config_free_texts_path
      result += javascript_include_tag "/assets/free_text.js"
    end
  end

#  key : id of the free text
#  options : class ...
  def free_text(key, options={})
    default_style = options[:default_style]
    free_text = FreeText::Text.find_by_key_and_locale(key, I18n.locale.to_s) ||
      FreeText::Text.create(:key => key, :locale => I18n.locale.to_s, :content => "#{"<#{default_style}>" if default_style}Editable text #{key}#{"</#{default_style}>" if default_style}")
    partial_locals = {
      :free_text => free_text,
      :div_class => options[:class],
      :class_restriction => options[:class_restriction]
    }
    logger.debug(partial_locals)
    render :partial => "free_text/partial", :locals => partial_locals
  end
end
