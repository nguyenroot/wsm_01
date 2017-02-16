module Zoo
  class Engine < ::Rails::Engine
    isolate_namespace Zoo
  end
end
