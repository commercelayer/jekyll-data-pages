module JekyllDataPages
  class DataPage < Jekyll::Page
    def initialize(site, base, dir, record, name, template, extension)
      @site = site
      @base = base
      @dir = dir
      @name = record[name].parameterize + "." + extension.to_s

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), template + ".html")
      self.data['title'] = record[name]
      self.data.merge!(record)
    end
  end
end
