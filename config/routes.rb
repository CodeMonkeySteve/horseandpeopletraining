ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/service.wsdl', :action => 'wsdl'
  map.connect '/:action', :controller => 'main', :action => 'about'
  map.connect ':controller/:action/:id', :controller => 'main'
end
