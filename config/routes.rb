Rails.application.routes.draw do
   resource :free_texts, :controller => 'free_text/texts', :only => :update do
     get 'aloha_config', :on => :member
   end
 end