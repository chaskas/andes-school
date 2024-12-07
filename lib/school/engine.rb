module School
  class Engine < ::Rails::Engine
    isolate_namespace School

    initializer "school.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
      app.config.assets.precompile += %w[ school_manifest ]
    end

    initializer "school.importmap", before: "importmap" do |app|
      app.config.importmap.paths << root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << root.join("app/javascript")
    end
  end
end
