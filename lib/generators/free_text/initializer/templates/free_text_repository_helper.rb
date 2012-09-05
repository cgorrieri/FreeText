module FreeTextRepositoryHelper

  require 'net/http'
  
  def get_repositories
    # Example of repositories
    # { name: 'Aloha Developers Wiki', url:'https://github.com/alohaeditor/Aloha-Editor/wiki', type:'website', weight: 0.50 }
    # { name: 'Aloha Editor - The HTML5 Editor', url:'http://aloha-editor.com', type:'website', weight: 0.90 }
    
    {:repositories => {}}
  end
end
