module JekyllDataPages
  class Generator < Jekyll::Generator
    safe true
    priority :normal

    def generate(site)

      if data_pages = site.config['data_pages']
        data_pages.each do |data_page|

          name = data_page['name']
          template = data_page['template'] || data_page['data']
          dir = data_page['dir'] || data_spec['data']
          extension = data_page['extension'] || "html"

          if site.layouts.key? template

            records = nil
            data_page['data'].split('.').each do |level|
              if records.nil?
                records = site.data[level]
              else
                records = records[level]
              end
            end

            records.each do |record|
              site.pages << DataPage.new(site, site.source, dir, record, name, template, extension)
            end
          else
            puts "Error: could not find template #{template}"
          end
        end
      end
    end

  end
end
